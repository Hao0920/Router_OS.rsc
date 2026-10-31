#!/usr/bin/env python3
"""
fwd - Generate plain RouterOS DNS Static FWD rules from multiple sources.
Output to output/fwd/gfw.rsc

Every deduplicated source domain produces one ordinary name-based FWD entry.
No regex compression or redundant-subdomain pruning is performed.
"""

import base64
import binascii
import json
import os
import re
import urllib.request
from urllib.parse import urlsplit

METACUBEX_URL = (
    "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/"
    "refs/heads/sing/geo/geosite/gfw.json"
)
CN_BLOCKED_URL = (
    "https://raw.githubusercontent.com/Loyalsoldier/cn-blocked-domain/"
    "refs/heads/release/domains.txt"
)
GFWLIST_URL = (
    "https://raw.githubusercontent.com/gfwlist/gfwlist/"
    "refs/heads/master/gfwlist.txt"
)
SOURCES = (
    ("MetaCubeX gfw", METACUBEX_URL, "metacubex"),
    ("Loyalsoldier cn-blocked-domain", CN_BLOCKED_URL, "plain"),
    ("gfwlist", GFWLIST_URL, "gfwlist"),
)

OUTPUT_DIR = "output/fwd"
OUTPUT_FILE = "gfw.rsc"
FORWARD_TO = "172.16.1.2"
RULE_COMMENT = "proxyconf: gfw to proxy"

DOMAIN_PATTERN = re.compile(
    r"^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?"
    r"(\.[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?)*$"
)


def normalize_domain(domain):
    """Normalize and validate a domain before writing RouterOS commands."""
    domain = domain.strip().lower().rstrip(".")
    if not DOMAIN_PATTERN.fullmatch(domain):
        raise ValueError(f"Invalid domain in source data: {domain!r}")
    return domain


def merge_entries(target, entries):
    """Merge entries; subdomain coverage wins when a domain is repeated."""
    for domain, match_subdomain in entries:
        target[domain] = target.get(domain, False) or match_subdomain


def parse_metacubex(text):
    """Parse MetaCubeX geosite JSON."""
    data = json.loads(text)
    entries = set()
    for rule in data.get("rules", []):
        unsupported = set(rule) - {"domain", "domain_suffix"}
        if unsupported:
            raise ValueError(
                "Unsupported geosite rule types: " + ", ".join(sorted(unsupported))
            )
        for domain in rule.get("domain_suffix", []):
            entries.add((normalize_domain(domain), True))
        for domain in rule.get("domain", []):
            entries.add((normalize_domain(domain), False))
    return entries


def parse_plain_domains(text):
    """Parse a newline-delimited plain domain list."""
    entries = set()
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith(("#", "!")):
            continue
        entries.add((normalize_domain(line), True))
    return entries


def parse_gfwlist(text):
    """Decode gfwlist and convert its unambiguous domain rules to DNS entries."""
    try:
        decoded = base64.b64decode("".join(text.split()), validate=True).decode("utf-8")
    except (binascii.Error, UnicodeDecodeError) as error:
        raise ValueError(f"Invalid Base64 gfwlist data: {error}") from error

    entries = set()
    skipped = 0
    for raw_line in decoded.splitlines():
        rule = raw_line.strip()
        if not rule or rule.startswith(("!", "[", "@@")):
            continue
        if rule.startswith("/") and rule.endswith("/"):
            skipped += 1
            continue

        match_subdomain = True
        if rule.startswith("||"):
            rule = rule[2:]
        elif rule.startswith("|"):
            rule = rule[1:]
            match_subdomain = False

        if "://" in rule:
            host = urlsplit(rule).hostname or ""
        else:
            host = rule.split("/", 1)[0].split(":", 1)[0]

        if host.startswith("*."):
            host = host[2:]
            match_subdomain = True
        if not host or "*" in host:
            skipped += 1
            continue
        try:
            entries.add((normalize_domain(host), match_subdomain))
        except ValueError:
            skipped += 1

    print(f"  gfwlist skipped unsupported rules: {skipped}")
    return entries


def fetch_source(name, url, parser_name):
    """Fetch and parse one source; the caller decides how to handle failures."""
    request = urllib.request.Request(url, headers={"User-Agent": "fwd-generator"})
    with urllib.request.urlopen(request, timeout=120) as response:
        text = response.read().decode("utf-8")

    parsers = {
        "metacubex": parse_metacubex,
        "plain": parse_plain_domains,
        "gfwlist": parse_gfwlist,
    }
    entries = parsers[parser_name](text)
    if not entries:
        raise ValueError(f"No domains found in {name}")
    print(f"Fetched {name}: {len(entries)} unique entries")
    return entries


def generate_rsc(entries, succeeded, failed):
    """Generate an idempotent RouterOS import script using plain FWD entries."""
    lines = ["# RouterOS DNS Static FWD - merged plain domain lists"]
    lines.extend(f"# Source: {url}" for _, url, _ in SOURCES)
    lines.extend(
        [
            f"# Build status: {'partial' if failed else 'complete'}",
            f"# Sources succeeded: {', '.join(succeeded)}",
            f"# Sources failed: {', '.join(failed) if failed else 'none'}",
            f"# Forward to: {FORWARD_TO}",
            f"# RouterOS rules: {len(entries)}",
            "# Compression: none",
            "# Re-importing replaces entries carrying the same comment.",
            f'/ip dns static remove [find comment="{RULE_COMMENT}"]',
        ]
    )

    for domain, match_subdomain in entries:
        match = "yes" if match_subdomain else "no"
        lines.append(
            f'/ip dns static add name="{domain}" type=FWD '
            f'forward-to={FORWARD_TO} match-subdomain={match} disabled=no '
            f'comment="{RULE_COMMENT}"'
        )

    lines.extend(["/ip dns cache flush", ""])
    filepath = os.path.join(OUTPUT_DIR, OUTPUT_FILE)
    with open(filepath, "w", encoding="utf-8", newline="\n") as file:
        file.write("\n".join(lines))

    print(f"Generated {filepath}: {len(entries)} plain FWD rules")


def main():
    merged = {}
    succeeded = []
    failed = []

    for name, url, parser_name in SOURCES:
        try:
            merge_entries(merged, fetch_source(name, url, parser_name))
            succeeded.append(name)
        except Exception as error:
            failed.append(name)
            print(f"Warning: {name} failed and will be skipped: {error}")

    if not succeeded:
        raise RuntimeError("All sources failed; refusing to publish an empty list")

    entries = sorted(merged.items(), key=lambda entry: entry[0])
    print(f"Total after cross-source deduplication: {len(entries)} unique domains")
    print(f"Sources succeeded: {', '.join(succeeded)}")
    if failed:
        print(f"Sources failed: {', '.join(failed)}")
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    generate_rsc(entries, succeeded, failed)


if __name__ == "__main__":
    main()
