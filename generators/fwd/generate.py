#!/usr/bin/env python3
"""
fwd - Generate RouterOS DNS Static FWD rules from MetaCubeX geosite data.
Output to output/fwd/gfw.rsc

Each domain_suffix becomes a Static FWD entry with match-subdomain=yes.
All matching DNS queries are forwarded to 172.16.1.2.
"""

import json
import os
import re
import urllib.request

SOURCE_URL = (
    "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/"
    "refs/heads/sing/geo/geosite/gfw.json"
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


def fetch_domains(url):
    """Fetch geosite JSON and return unique (domain, match_subdomain) pairs."""
    request = urllib.request.Request(url, headers={"User-Agent": "fwd-generator"})
    with urllib.request.urlopen(request, timeout=120) as response:
        data = json.load(response)

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

    if not entries:
        raise ValueError("No domains found in source data")

    return sorted(entries, key=lambda entry: (entry[0], entry[1]))


def generate_rsc(entries):
    """Generate an idempotent RouterOS import script."""
    lines = [
        "# RouterOS DNS Static FWD - MetaCubeX gfw",
        f"# Source: {SOURCE_URL}",
        f"# Forward to: {FORWARD_TO}",
        f"# Total: {len(entries)} entries",
        "# Re-importing replaces entries carrying the same comment.",
        f'/ip dns static remove [find comment="{RULE_COMMENT}"]',
    ]

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

    print(f"Generated {filepath}: {len(entries)} entries")


def main():
    entries = fetch_domains(SOURCE_URL)
    print(f"Fetched {len(entries)} unique domains")
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    generate_rsc(entries)


if __name__ == "__main__":
    main()
