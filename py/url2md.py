#!/usr/bin/env python3
"""Fetches a web page via jina.ai and outputs Markdown-formatted content.

Usage: url2md <url>
"""

from __future__ import annotations

import argparse
import sys
import urllib.parse
import urllib.request

HEADERS = {
    "DNT": "1",
    "X-Base": "final",
    "X-Engine": "direct",
    "X-Md-Em-Delimiter": "*",
    "X-Md-Heading-Style": "setext",
    "X-Md-Link-Reference-Style": "collapsed",
    "X-Md-Link-Style": "referenced",
}


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Fetch Markdown from jina.ai")
    parser.add_argument("url")
    args = parser.parse_args(argv)

    target = f"https://r.jina.ai/{urllib.parse.quote(args.url, safe='')}"
    request = urllib.request.Request(target, headers=HEADERS)
    with urllib.request.urlopen(request) as response:  # nosec: trusted endpoint
        sys.stdout.write(response.read().decode("utf-8"))


if __name__ == "__main__":
    main()
