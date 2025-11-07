#!/usr/bin/env python3
"""Runs tree and highlights matches for a pattern within a directory.

Usage: treefind [pattern] [directory]
"""

from __future__ import annotations

import argparse
import os
import subprocess


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Run tree with filtering")
    parser.add_argument("pattern", nargs="?")
    parser.add_argument("directory", nargs="?", default=os.getcwd())
    args = parser.parse_args(argv)

    if args.pattern is None:
        subprocess.run(["tree", os.getcwd()], check=False)
        return

    ignore_case = "" if any(ch.isupper() for ch in args.pattern) else "--ignore-case"
    command = ["tree", "--prune", "--matchdirs", "-P", args.pattern, args.directory]
    if ignore_case:
        command.insert(1, ignore_case)
    subprocess.run(command, check=False)


if __name__ == "__main__":
    main()
