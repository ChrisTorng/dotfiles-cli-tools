# CLI Tools

A grab bag of small command-line helpers. Add \`sh/\` to your PATH or symlink the scripts you need.

These scripts are sourced from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) (`home/bin/bin`).
For a narrative tour of many of the tools, see the author's post
["Scripts I wrote that I use all the time"](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/).

## Scripts

| Tool | Shell | Python | PowerShell | CMD | Description |
| --- | --- | --- | --- | --- | --- |
| alphabet | [sh](sh/alphabet) | [py](py/alphabet.py) | [ps1](ps/alphabet.ps1) | [cmd](cmd/alphabet.cmd) | Prints the lowercase and uppercase English alphabets for quick reference. |
| bb | [sh](sh/bb) | [py](py/bb.py) | [ps1](ps/bb.ps1) | — | Runs a command in the background while silencing stdout/stderr if launched from a terminal. |
| bytedump | [sh](sh/bytedump) | [py](py/bytedump.py) | [ps1](ps/bytedump.ps1) | — | Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal. |
| catbin | [sh](sh/catbin) | [py](py/catbin.py) | [ps1](ps/catbin.ps1) | [cmd](cmd/catbin.cmd) | Shows the contents of an executable found in your PATH using cat or bat. |
| clock | [sh](sh/clock) | [py](py/clock.py) | [ps1](ps/clock.ps1) | — | Continuously displays the current time using watch. |
| cls | [sh](sh/cls) | [py](py/cls.py) | [ps1](ps/cls.ps1) | [cmd](cmd/cls.cmd) | Clears the current terminal screen. |
| copy | [sh](sh/copy) | [py](py/copy.py) | [ps1](ps/copy.ps1) | [cmd](cmd/copy.cmd) | Copies stdin or a file's contents to the system clipboard with several platform fallbacks. |
| cptmp | [sh](sh/cptmp) | [py](py/cptmp.py) | [ps1](ps/cptmp.ps1) | [cmd](cmd/cptmp.cmd) | Creates a temporary file path, prints it, and copies it to the clipboard. |
| cpwd | [sh](sh/cpwd) | [py](py/cpwd.py) | [ps1](ps/cpwd.ps1) | [cmd](cmd/cpwd.cmd) | Copies the current working directory path to the clipboard. |
| csv2md | [sh](sh/csv2md) | [py](py/csv2md.py) | [ps1](ps/csv2md.ps1) | — | Converts a CSV file into a Markdown table printed to stdout. |
| datesort | [sh](sh/datesort) | [py](py/datesort.py) | [ps1](ps/datesort.ps1) | — | Suggests moves to organize files into year-based folders inferred from filenames. |
| ds-destroy | [sh](sh/ds-destroy) | [py](py/ds_destroy.py) | [ps1](ps/ds-destroy.ps1) | — | Recursively removes .DS_Store files in the current directory tree. |
| duck | [sh](sh/duck) | [py](py/duck.py) | [ps1](ps/duck.ps1) | [cmd](cmd/duck.cmd) | Opens DuckDuckGo in the browser, optionally searching for the provided terms. |
| duckl | [sh](sh/duckl) | [py](py/duckl.py) | [ps1](ps/duckl.ps1) | [cmd](cmd/duckl.cmd) | Opens the lightweight DuckDuckGo interface with an optional search query. |
| each | [sh](sh/each) | [py](py/each.py) | [ps1](ps/each.ps1) | — | Runs a shell command for each line of stdin by replacing {} in the template. |
| emoji | [sh](sh/emoji) | [py](py/emoji.py) | [ps1](ps/emoji.ps1) | — | Lists emoji codes, optionally filtered by a case-insensitive search term. |
| extensions | [sh](sh/extensions) | [py](py/extensions.py) | [ps1](ps/extensions.ps1) | — | Prints unique file extensions from newline-delimited paths on stdin. |
| extract | [sh](sh/extract) | [py](py/extract.py) | [ps1](ps/extract.ps1) | — | Extracts common archive formats into appropriately named directories. |
| f | [sh](sh/f) | [py](py/f.py) | [ps1](ps/f.ps1) | — | Shortcut for grep that forwards all arguments. |
| ffmpeg-smallest | [sh](sh/ffmpeg-smallest) | [py](py/ffmpeg_smallest.py) | [ps1](ps/ffmpeg-smallest.ps1) | — | Transcodes a media file to several formats and keeps the smallest result. |
| flushdns | [sh](sh/flushdns) | [py](py/flushdns.py) | [ps1](ps/flushdns.ps1) | [cmd](cmd/flushdns.cmd) | Flushes the local DNS cache on supported systems (currently macOS). |
| g | [sh](sh/g) | [py](py/g.py) | [ps1](ps/g.ps1) | [cmd](cmd/g.cmd) | Runs git with the provided arguments, defaulting to git status. |
| getpod | [sh](sh/getpod) | [py](py/getpod.py) | [ps1](ps/getpod.ps1) | [cmd](cmd/getpod.cmd) | Downloads audio from online sources via yt-dlp with podcast-friendly settings. |
| getsong | [sh](sh/getsong) | [py](py/getsong.py) | [ps1](ps/getsong.ps1) | [cmd](cmd/getsong.cmd) | Fetches the best available audio stream via yt-dlp. |
| getsubs | [sh](sh/getsubs) | [py](py/getsubs.py) | [ps1](ps/getsubs.ps1) | — | Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data. |
| git-fzf-checkout | [sh](sh/git-fzf-checkout) | [py](py/git_fzf_checkout.py) | [ps1](ps/git-fzf-checkout.ps1) | — | Uses fzf to interactively select and check out a git branch. |
| hoy | [sh](sh/hoy) | [py](py/hoy.py) | [ps1](ps/hoy.ps1) | [cmd](cmd/hoy.cmd) | Prints today's date in YYYY-MM-DD format without a trailing newline. |
| httpstatus | [sh](sh/httpstatus) | [py](py/httpstatus.py) | [ps1](ps/httpstatus.ps1) | — | Shows HTTP status codes and descriptions, optionally filtered by a pattern. |
| iclj | [sh](sh/iclj) | [py](py/iclj.py) | [ps1](ps/iclj.ps1) | — | Starts a Leiningen Clojure REPL in the current project. |
| ijs | [sh](sh/ijs) | [py](py/ijs.py) | [ps1](ps/ijs.ps1) | [cmd](cmd/ijs.cmd) | Opens an interactive JavaScript REPL using Deno, Node, or osascript. |
| iphp | [sh](sh/iphp) | [py](py/iphp.py) | [ps1](ps/iphp.ps1) | [cmd](cmd/iphp.cmd) | Launches the PHP interactive shell. |
| ipy | [sh](sh/ipy) | [py](py/ipy.py) | [ps1](ps/ipy.ps1) | [cmd](cmd/ipy.cmd) | Starts the Python interactive interpreter. |
| isql | [sh](sh/isql) | [py](py/isql.py) | [ps1](ps/isql.ps1) | [cmd](cmd/isql.cmd) | Opens an in-memory SQLite shell session. |
| jsonformat | [sh](sh/jsonformat) | [py](py/jsonformat.py) | [ps1](ps/jsonformat.ps1) | — | Pretty-prints JSON from stdin using node, jq, or cat as a fallback. |
| l | [sh](sh/l) | [py](py/l.py) | [ps1](ps/l.ps1) | [cmd](cmd/l.cmd) | Runs ls with the provided arguments. |
| la | [sh](sh/la) | [py](py/la.py) | [ps1](ps/la.ps1) | [cmd](cmd/la.cmd) | Runs ls -a with color flags appropriate for the current platform. |
| length | [sh](sh/length) | [py](py/length.py) | [ps1](ps/length.ps1) | [cmd](cmd/length.cmd) | Counts the number of characters in the provided arguments. |
| line | [sh](sh/line) | [py](py/line.py) | [ps1](ps/line.ps1) | [cmd](cmd/line.cmd) | Prints the Nth line from stdin. |
| list-colors | [sh](sh/list-colors) | [py](py/list_colors.py) | [ps1](ps/list-colors.ps1) | — | Displays the 0-255 ANSI color codes. |
| lowered | [sh](sh/lowered) | [py](py/lowered.py) | [ps1](ps/lowered.ps1) | [cmd](cmd/lowered.cmd) | Converts stdin to lowercase characters. |
| markdownquote | [sh](sh/markdownquote) | [py](py/markdownquote.py) | [ps1](ps/markdownquote.ps1) | — | Wraps input in Markdown blockquote syntax while preserving blank lines. |
| math | [sh](sh/math) | [py](py/math.py) | [ps1](ps/math.ps1) | — | Opens a calculator REPL, preferring rink, then Python, then bc. |
| mergepdfs | [sh](sh/mergepdfs) | [py](py/mergepdfs.py) | [ps1](ps/mergepdfs.ps1) | — | Merges multiple PDFs into a single file using Ghostscript. |
| mksh | [sh](sh/mksh) | [py](py/mksh.py) | [ps1](ps/mksh.ps1) | — | Creates an executable bash script template at the given path and opens it in $EDITOR. |
| movs2mp4s | [sh](sh/movs2mp4s) | [py](py/movs2mp4s.py) | [ps1](ps/movs2mp4s.ps1) | — | Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg. |
| murder | [sh](sh/murder) | [py](py/murder.py) | [ps1](ps/murder.ps1) | — | Interactively kills processes by PID, name, or listening port with escalating signals. |
| myip | [sh](sh/myip) | [py](py/myip.py) | [ps1](ps/myip.ps1) | — | Reports your local and/or public IP address. |
| nagd | [sh](sh/nagd) | [py](py/nagd.py) | [ps1](ps/nagd.ps1) | — | Sends a desktop notification every few minutes as a reminder. |
| nato | [sh](sh/nato) | [py](py/nato.py) | [ps1](ps/nato.ps1) | [cmd](cmd/nato.cmd) | Spells the supplied words using the NATO phonetic alphabet. |
| note | [sh](sh/note) | [py](py/note.py) | [ps1](ps/note.ps1) | — | Creates or opens a markdown note in ~/notes with an optional title or archive flag. |
| notify | [sh](sh/notify) | [py](py/notify.py) | [ps1](ps/notify.ps1) | — | Sends a desktop notification using notify-send or macOS scripting as fallbacks. |
| npm-repack | [sh](sh/npm-repack) | [py](py/npm_repack.py) | [ps1](ps/npm-repack.ps1) | — | Repackages an npm tarball with optimal gzip compression for size comparison. |
| npm-unused | [sh](sh/npm-unused) | [py](py/npm_unused.py) | [ps1](ps/npm-unused.ps1) | — | Reports npm dependencies that are not required anywhere in the repository. |
| npm-update-dependencies | [sh](sh/npm-update-dependencies) | [py](py/npm_update_dependencies.py) | [ps1](ps/npm-update-dependencies.ps1) | — | Updates package.json dependencies to their latest versions. |
| npm-update-dev-dependencies | [sh](sh/npm-update-dev-dependencies) | [py](py/npm_update_dev_dependencies.py) | [ps1](ps/npm-update-dev-dependencies.ps1) | — | Updates package.json devDependencies to their latest versions. |
| ocr | [sh](sh/ocr) | [py](py/ocr.py) | [ps1](ps/ocr.ps1) | — | Performs OCR on an image using Apple's Vision framework and prints the recognized text. |
| pasta | [sh](sh/pasta) | [py](py/pasta.py) | [ps1](ps/pasta.ps1) | — | Prints clipboard contents with platform-specific fallbacks. |
| pastas | [sh](sh/pastas) | [py](py/pastas.py) | [ps1](ps/pastas.ps1) | — | Continuously prints clipboard changes until interrupted. |
| pingbing | [sh](sh/pingbing) | [py](py/pingbing.py) | [ps1](ps/pingbing.ps1) | [cmd](cmd/pingbing.cmd) | Pings duckduckgo.com once to check connectivity. |
| pingen | [sh](sh/pingen) | [py](py/pingen.py) | [ps1](ps/pingen.ps1) | [cmd](cmd/pingen.cmd) | Generates a random numeric PIN of the requested length. |
| pix | [sh](sh/pix) | [py](py/pix.py) | [ps1](ps/pix.ps1) | — | Displays images in mpv, looping each frame indefinitely. |
| prettypath | [sh](sh/prettypath) | [py](py/prettypath.py) | [ps1](ps/prettypath.ps1) | — | Prints the PATH environment variable one directory per line. |
| radio | [sh](sh/radio) | [py](py/radio.py) | [ps1](ps/radio.ps1) | [cmd](cmd/radio.cmd) | Streams a preset internet radio station with mpv. |
| removeexif | [sh](sh/removeexif) | [py](py/removeexif.py) | [ps1](ps/removeexif.ps1) | — | Strips EXIF metadata from JPEG images using jhead. |
| rn | [sh](sh/rn) | [py](py/rn.py) | [ps1](ps/rn.ps1) | — | Shows the current time and today's calendar with the current date highlighted. |
| running | [sh](sh/running) | [py](py/running.py) | [ps1](ps/running.ps1) | — | Lists running processes, optionally filtering by a case-insensitive pattern. |
| scratch | [sh](sh/scratch) | [py](py/scratch.py) | [ps1](ps/scratch.ps1) | [cmd](cmd/scratch.cmd) | Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired. |
| serveit | [sh](sh/serveit) | [py](py/serveit.py) | [ps1](ps/serveit.ps1) | [cmd](cmd/serveit.cmd) | Starts a simple HTTP server in the current directory on the chosen port. |
| sfx | [sh](sh/sfx) | [py](py/sfx.py) | [ps1](ps/sfx.ps1) | [cmd](cmd/sfx.cmd) | Plays a named sound effect from the configured effects directory using mpv. |
| shrinkvid | [sh](sh/shrinkvid) | [py](py/shrinkvid.py) | [ps1](ps/shrinkvid.ps1) | — | Re-encodes a video to H.264 with a chosen CRF for smaller output. |
| sleepybear | [sh](sh/sleepybear) | [py](py/sleepybear.py) | [ps1](ps/sleepybear.ps1) | [cmd](cmd/sleepybear.cmd) | Puts the computer to sleep using macOS or Linux commands. |
| snippet | [sh](sh/snippet) | [py](py/snippet.py) | [ps1](ps/snippet.ps1) | — | Shortcut that forwards arguments to the snippets helper command. |
| snippets | [sh](sh/snippets) | [py](py/snippets.py) | [ps1](ps/snippets.ps1) | — | Outputs a stored snippet file from ~/.config/evanhahn-snippets. |
| speak | [sh](sh/speak) | [py](py/speak.py) | [ps1](ps/speak.ps1) | [cmd](cmd/speak.cmd) | Speaks Markdown input aloud using say or espeak-ng if available. |
| stopwatch | [sh](sh/stopwatch) | [py](py/stopwatch.py) | [ps1](ps/stopwatch.ps1) | — | Measures elapsed time by timing stdin until EOF. |
| straightquote | [sh](sh/straightquote) | [py](py/straightquote.py) | [ps1](ps/straightquote.ps1) | — | Converts curly quotes in the input to straight ASCII quotes. |
| theme | [sh](sh/theme) | [py](py/theme.py) | [ps1](ps/theme.ps1) | — | Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments. |
| timer | [sh](sh/timer) | [py](py/timer.py) | [ps1](ps/timer.ps1) | — | Sleeps for the specified duration then plays a sound and sends a notification. |
| transcribe | [sh](sh/transcribe) | [py](py/transcribe.py) | [ps1](ps/transcribe.ps1) | — | Uses OpenAI Whisper to transcribe recordings or provided audio files. |
| trash | [sh](sh/trash) | [py](py/trash.py) | [ps1](ps/trash.ps1) | — | Moves files to the system trash using Finder or gio depending on the platform. |
| treefind | [sh](sh/treefind) | [py](py/treefind.py) | [ps1](ps/treefind.ps1) | — | Runs tree and highlights matches for a pattern within a directory. |
| tryna | [sh](sh/tryna) | [py](py/tryna.py) | [ps1](ps/tryna.ps1) | — | Repeatedly runs a command until it succeeds. |
| trynafail | [sh](sh/trynafail) | [py](py/trynafail.py) | [ps1](ps/trynafail.ps1) | — | Repeatedly runs a command until it fails. |
| tuivid | [sh](sh/tuivid) | [py](py/tuivid.py) | [ps1](ps/tuivid.ps1) | — | Plays video in the terminal using mpv's tct video output. |
| tunes | [sh](sh/tunes) | [py](py/tunes.py) | [ps1](ps/tunes.ps1) | [cmd](cmd/tunes.cmd) | Streams audio-only playback via mpv, deferring to yt-dlp for URLs. |
| u+ | [sh](sh/u+) | [py](py/u_plus.py) | [ps1](ps/u+.ps1) | — | Prints the Unicode character and name for a hexadecimal code point. |
| uppered | [sh](sh/uppered) | [py](py/uppered.py) | [ps1](ps/uppered.ps1) | [cmd](cmd/uppered.cmd) | Converts stdin to uppercase characters. |
| upup | [sh](sh/upup) | [py](py/upup.py) | [ps1](ps/upup.ps1) | — | Updates Homebrew and Flatpak packages if the tools are available. |
| url | [sh](sh/url) | [py](py/url.py) | [ps1](ps/url.ps1) | — | Parses a URL into its component parts and prints them. |
| url2md | [sh](sh/url2md) | [py](py/url2md.py) | [ps1](ps/url2md.ps1) | — | Fetches a web page via jina.ai and outputs Markdown-formatted content. |
| uuid | [sh](sh/uuid) | [py](py/uuid.py) | [ps1](ps/uuid.ps1) | [cmd](cmd/uuid.cmd) | Generates a random UUID v4 and prints it. |
| view | [sh](sh/view) | [py](py/view.py) | [ps1](ps/view.ps1) | — | Opens the target file in read-only mode using the configured editor. |
| vimplug | [sh](sh/vimplug) | [py](py/vimplug.py) | [ps1](ps/vimplug.ps1) | — | Downloads vim-plug into the appropriate autoload directory if missing. |
| waitfor | [sh](sh/waitfor) | [py](py/waitfor.py) | [ps1](ps/waitfor.ps1) | — | Prevents sleep while waiting for a PID to exit using platform tools. |
| wifi | [sh](sh/wifi) | [py](py/wifi.py) | [ps1](ps/wifi.ps1) | — | Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS). |

Entries marked with — do not currently have a cross-platform rewrite because they rely on platform-specific tooling or interactive shell behavior.

## License

These scripts are available under the [MIT License](LICENSE). They were originally published in
[EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) under the
[Unlicense](https://codeberg.org/EvanHahn/dotfiles/src/branch/main/LICENSE.txt).
