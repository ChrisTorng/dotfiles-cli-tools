#!/usr/bin/env python3
"""Updates package.json dependencies to their latest versions.

Usage: npm-update-dependencies
"""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


def load_dependencies() -> list[str]:
    pkg_path = Path.cwd() / "package.json"
    if not pkg_path.exists():
        print("npm-update-dependencies: can't find package.json", file=sys.stderr)
        sys.exit(1)
    pkg = json.loads(pkg_path.read_text(encoding="utf-8"))
    deps = pkg.get("dependencies", {})
    return [f"{name}@latest" for name in deps.keys()]


def main() -> None:
    deps = load_dependencies()
    if not deps:
        return
    subprocess.run(["npm", "install", "--save", *deps], check=False)


if __name__ == "__main__":
    main()
