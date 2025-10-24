#!/usr/bin/env python3
"""Outputs a stored snippet file from ~/.config/evanhahn-snippets.

Usage: snippets <name>
"""

from __future__ import annotations

import os
import sys
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if len(args) != 1:
        print("must pass exactly 1 argument", file=sys.stderr)
        sys.exit(1)
    name = args[0]
    config_home = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    path = config_home / "evanhahn-snippets" / name
    try:
        sys.stdout.write(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        print(f"no snippet found at {path}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
