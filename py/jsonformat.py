#!/usr/bin/env python3
"""Pretty-prints JSON from stdin using the standard library.

Usage: jsonformat < data.json
"""

from __future__ import annotations

import argparse
import json
import sys


def main() -> None:
    parser = argparse.ArgumentParser(description="Pretty-print JSON from stdin")
    parser.parse_args()

    data = sys.stdin.read()
    if not data.strip():
        return
    try:
        parsed = json.loads(data)
    except json.JSONDecodeError as exc:
        print(f"jsonformat: invalid JSON ({exc})", file=sys.stderr)
        sys.exit(1)
    print(json.dumps(parsed, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
