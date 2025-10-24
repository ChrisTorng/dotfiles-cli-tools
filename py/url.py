#!/usr/bin/env python3
"""Parses a URL into its component parts and prints them.

Usage: url <url>
"""

import argparse
from urllib.parse import parse_qsl, urlparse


def print_parts(url: str) -> None:
    parsed = urlparse(url)

    print("original:", url)
    print("protocol:", parsed.scheme)

    if parsed.username is not None:
        print("username:", parsed.username)

    if parsed.password is not None:
        print("password:", parsed.password)

    if parsed.hostname is not None:
        print("hostname:", parsed.hostname)

    if parsed.port is not None:
        print("port:", parsed.port)

    if parsed.path:
        print("path:", parsed.path)

    if parsed.query:
        print("query:", parsed.query)
        for key, value in parse_qsl(parsed.query):
            print("-", key, value)


def main() -> None:
    parser = argparse.ArgumentParser(description="Print out the parts of a URL")
    parser.add_argument("url", type=str, help="The URL to parse")
    args = parser.parse_args()
    print_parts(args.url)


if __name__ == "__main__":
    main()

if len(parsed.fragment) != 0:
    print("hash:", parsed.fragment)