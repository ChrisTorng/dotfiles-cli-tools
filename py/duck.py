#!/usr/bin/env python3
"""Opens DuckDuckGo in the browser, optionally searching for the provided terms.

Usage: duck [search terms...]
"""

from __future__ import annotations

import os
import shlex
import subprocess
import sys
import urllib.parse
import webbrowser

BASE_URL = "https://duckduckgo.com"


def open_with_browser(url: str) -> None:
    browser = os.environ.get("BROWSER")
    if browser:
        command = shlex.split(browser) + [url]
        subprocess.run(command, check=False)
    else:
        webbrowser.open(url)


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        open_with_browser(BASE_URL)
        return

    query = urllib.parse.quote_plus(" ".join(args))
    open_with_browser(f"{BASE_URL}/?q={query}")


if __name__ == "__main__":
    main()
