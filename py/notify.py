#!/usr/bin/env python3
"""Sends a desktop notification using notify-send or macOS scripting as fallbacks.

Usage: notify [title] [message]
"""

from __future__ import annotations

import argparse
import datetime as _dt
import json
import subprocess
import sys


def try_run(command: list[str]) -> bool:
    try:
        result = subprocess.run(command, check=False)
    except FileNotFoundError:
        return False
    return result.returncode == 0


def notify(title: str, description: str) -> None:
    if try_run(["notify-send", "--expire-time=5000", title, description]):
        return

    js = """
var app = Application.currentApplication();
app.includeStandardAdditions = true;
app.displayNotification(%s, { withTitle: %s });
""" % (json.dumps(description), json.dumps(title))
    if try_run(["osascript", "-l", "JavaScript", "-e", js]):
        return

    if sys.platform.startswith("win"):
        powershell = [
            "powershell",
            "-NoProfile",
            "-Command",
            "Add-Type -AssemblyName PresentationFramework;"
            "[System.Windows.MessageBox]::Show('%s','%s')" % (
                description.replace("'", "''"),
                title.replace("'", "''"),
            ),
        ]
        if try_run(powershell):
            return

    print("notify: can't send notifications", file=sys.stderr)
    sys.exit(1)


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Send a desktop notification")
    parser.add_argument("title", nargs="?", default="Notification")
    parser.add_argument("message", nargs="?", default=_dt.datetime.now().isoformat())
    args = parser.parse_args(argv)

    notify(args.title, args.message)


if __name__ == "__main__":
    main()
