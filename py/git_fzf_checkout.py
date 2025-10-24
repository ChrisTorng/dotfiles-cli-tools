#!/usr/bin/env python3
"""Uses fzf to interactively select and check out a git branch.

Usage: git-fzf-checkout
"""

from __future__ import annotations

import subprocess
import sys


def choose_branch() -> str | None:
    branches = subprocess.run(
        ["git", "branch"],
        check=False,
        capture_output=True,
        text=True,
    )
    if branches.returncode != 0:
        return None
    fzf = subprocess.run(
        ["fzf", "+m", "--height=1%"],
        input=branches.stdout,
        text=True,
        capture_output=True,
        check=False,
    )
    if fzf.returncode != 0 or not fzf.stdout.strip():
        return None
    selection = fzf.stdout.strip()
    return selection.split()[-1]


def main() -> None:
    branch = choose_branch()
    if not branch:
        sys.exit(1)
    subprocess.run(["git", "checkout", branch], check=False)


if __name__ == "__main__":
    main()
