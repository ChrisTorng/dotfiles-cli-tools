#!/usr/bin/env python3
"""Streams a preset internet radio station with mpv.

Usage: radio <lofi|trance|salsa|kfai>
"""

from __future__ import annotations

import argparse
import subprocess

STATIONS = {
    "lofi": "https://live.hunter.fm/lofi_low",
    "trance": "http://ubuntu.hbr1.com:19800/trance.ogg",
    "salsa": "https://latinasalsa.ice.infomaniak.ch/latinasalsa.mp3",
    "kfai": "https://kfai.broadcasttool.stream/kfai-1",
}


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Stream an internet radio station")
    parser.add_argument("station", choices=STATIONS.keys())
    args = parser.parse_args(argv)

    subprocess.run(["mpv", "--really-quiet", STATIONS[args.station]], check=False)


if __name__ == "__main__":
    main()
