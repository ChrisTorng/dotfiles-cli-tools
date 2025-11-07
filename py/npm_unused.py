#!/usr/bin/env python3
"""Reports npm dependencies that are not required anywhere in the repository.

Usage: npm-unused
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

PATTERN_TEMPLATE = r"require(['\"]%s"


def load_package_json() -> dict:
    pkg_path = Path.cwd() / "package.json"
    if not pkg_path.exists():
        print("npm-unused: can't find package.json in this folder", file=sys.stderr)
        sys.exit(1)
    return json.loads(pkg_path.read_text(encoding="utf-8"))


def dependency_names(package: dict) -> list[str]:
    deps = package.get("dependencies", {})
    dev = package.get("devDependencies", {})
    names = sorted(set(deps.keys()) | set(dev.keys()))
    return names


def is_used(name: str) -> bool:
    pattern = PATTERN_TEMPLATE % re.escape(name)
    result = subprocess.run(
        ["git", "grep", "-q", pattern],
        check=False,
    )
    return result.returncode == 0


def main() -> None:
    package = load_package_json()
    unused: list[str] = []
    for dep in dependency_names(package):
        if not is_used(dep):
            unused.append(dep)
            print(f"{dep} not required anywhere", file=sys.stderr)

    if unused:
        print(
            "\nnote: a module can still be used even if it's not required. take care uninstalling these packages",
            file=sys.stderr,
        )
        sys.exit(1)
    print("all good!")


if __name__ == "__main__":
    main()
