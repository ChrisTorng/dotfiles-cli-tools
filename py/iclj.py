#!/usr/bin/env python3
"""Starts a Leiningen Clojure REPL in the current project.

Usage: iclj
"""

from __future__ import annotations

import subprocess


def main() -> None:
    subprocess.run(["lein", "repl"], check=False)


if __name__ == "__main__":
    main()
