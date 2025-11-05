# CLI Tools

A grab bag of small command-line helpers. Add \`sh/\` to your PATH or symlink the scripts you need.

These scripts are sourced from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) (`home/bin/bin`).
For a narrative tour of many of the tools, see the author's post
["Scripts I wrote that I use all the time"](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/).

## Scripts

| Tool | Shell | Python | PowerShell | CMD | Description |
| --- | --- | --- | --- | --- | --- |
| alphabet | [alphabet](sh/alphabet) | [alphabet.py](py/alphabet.py) | [alphabet.ps1](ps/alphabet.ps1) | [alphabet.cmd](cmd/alphabet.cmd) | Prints the lowercase and uppercase English alphabets for quick reference. |
| bb | [bb](sh/bb) | — | — | — | Runs a command in the background while silencing stdout/stderr if launched from a terminal. |
| bytedump | [bytedump](sh/bytedump) | — | — | — | Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal. |
| catbin | [catbin](sh/catbin) | — | — | — | Shows the contents of an executable found in your PATH using cat or bat. |
| clock | [clock](sh/clock) | — | — | — | Continuously displays the current time using watch. |
| cls | [cls](sh/cls) | — | — | — | Clears the current terminal screen. |
| copy | [copy](sh/copy) | — | — | — | Copies stdin or a file's contents to the system clipboard with several platform fallbacks. |
| cptmp | [cptmp](sh/cptmp) | — | — | — | Creates a temporary file path, prints it, and copies it to the clipboard. |
| cpwd | [cpwd](sh/cpwd) | — | — | — | Copies the current working directory path to the clipboard. |
| csv2md | [csv2md](sh/csv2md) | — | — | — | Converts a CSV file into a Markdown table printed to stdout. |
| datesort | [datesort](sh/datesort) | — | — | — | Suggests moves to organize files into year-based folders inferred from filenames. |
| ds-destroy | [ds-destroy](sh/ds-destroy) | — | — | — | Recursively removes .DS_Store files in the current directory tree. |
| duck | [duck](sh/duck) | — | — | — | Opens DuckDuckGo in the browser, optionally searching for the provided terms. |
| duckl | [duckl](sh/duckl) | — | — | — | Opens the lightweight DuckDuckGo interface with an optional search query. |
| each | [each](sh/each) | — | — | — | Runs a shell command for each line of stdin by replacing {} in the template. |
| emoji | [emoji](sh/emoji) | — | — | — | Lists emoji codes, optionally filtered by a case-insensitive search term. |
| extensions | [extensions](sh/extensions) | — | — | — | Prints unique file extensions from newline-delimited paths on stdin. |
| extract | [extract](sh/extract) | — | — | — | Extracts common archive formats into appropriately named directories. |
| f | [f](sh/f) | — | — | — | Shortcut for grep that forwards all arguments. |
| ffmpeg-smallest | [ffmpeg-smallest](sh/ffmpeg-smallest) | — | — | — | Transcodes a media file to several formats and keeps the smallest result. |
| flushdns | [flushdns](sh/flushdns) | — | — | — | Flushes the local DNS cache on supported systems (currently macOS). |
| g | [g](sh/g) | — | — | — | Runs git with the provided arguments, defaulting to git status. |
| getpod | [getpod](sh/getpod) | — | — | — | Downloads audio from online sources via yt-dlp with podcast-friendly settings. |
| getsong | [getsong](sh/getsong) | — | — | — | Fetches the best available audio stream via yt-dlp. |
| getsubs | [getsubs](sh/getsubs) | — | — | — | Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data. |
| git-fzf-checkout | [git-fzf-checkout](sh/git-fzf-checkout) | — | — | — | Uses fzf to interactively select and check out a git branch. |
| hoy | [hoy](sh/hoy) | [hoy.py](py/hoy.py) | [hoy.ps1](ps/hoy.ps1) | [hoy.cmd](cmd/hoy.cmd) | Prints today's date in YYYY-MM-DD format without a trailing newline. |
| httpstatus | [httpstatus](sh/httpstatus) | — | — | — | Shows HTTP status codes and descriptions, optionally filtered by a pattern. |
| iclj | [iclj](sh/iclj) | — | — | — | Starts a Leiningen Clojure REPL in the current project. |
| ijs | [ijs](sh/ijs) | — | — | — | Opens an interactive JavaScript REPL using Deno, Node, or osascript. |
| iphp | [iphp](sh/iphp) | — | — | — | Launches the PHP interactive shell. |
| ipy | [ipy](sh/ipy) | — | — | — | Starts the Python interactive interpreter. |
| isql | [isql](sh/isql) | — | — | — | Opens an in-memory SQLite shell session. |
| jsonformat | [jsonformat](sh/jsonformat) | — | — | — | Pretty-prints JSON from stdin using node, jq, or cat as a fallback. |
| l | [l](sh/l) | — | — | — | Runs ls with the provided arguments. |
| la | [la](sh/la) | — | — | — | Runs ls -a with color flags appropriate for the current platform. |
| length | [length](sh/length) | [length.py](py/length.py) | [length.ps1](ps/length.ps1) | [length.cmd](cmd/length.cmd) | Counts the number of characters in the provided arguments. |
| line | [line](sh/line) | [line.py](py/line.py) | [line.ps1](ps/line.ps1) | [line.cmd](cmd/line.cmd) | Prints the Nth line from stdin. |
| list-colors | [list-colors](sh/list-colors) | — | — | — | Displays the 0-255 ANSI color codes. |
| lowered | [lowered](sh/lowered) | [lowered.py](py/lowered.py) | [lowered.ps1](ps/lowered.ps1) | [lowered.cmd](cmd/lowered.cmd) | Converts stdin to lowercase characters. |
| markdownquote | [markdownquote](sh/markdownquote) | — | — | — | Wraps input in Markdown blockquote syntax while preserving blank lines. |
| math | [math](sh/math) | — | — | — | Opens a calculator REPL, preferring rink, then Python, then bc. |
| mergepdfs | [mergepdfs](sh/mergepdfs) | — | — | — | Merges multiple PDFs into a single file using Ghostscript. |
| mksh | [mksh](sh/mksh) | — | — | — | Creates an executable bash script template at the given path and opens it in $EDITOR. |
| movs2mp4s | [movs2mp4s](sh/movs2mp4s) | — | — | — | Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg. |
| murder | [murder](sh/murder) | — | — | — | Interactively kills processes by PID, name, or listening port with escalating signals. |
| myip | [myip](sh/myip) | — | — | — | Reports your local and/or public IP address. |
| nagd | [nagd](sh/nagd) | — | — | — | Sends a desktop notification every few minutes as a reminder. |
| nato | [nato](sh/nato) | [nato.py](py/nato.py) | [nato.ps1](ps/nato.ps1) | [nato.cmd](cmd/nato.cmd) | Spells the supplied words using the NATO phonetic alphabet. |
| note | [note](sh/note) | — | — | — | Creates or opens a markdown note in ~/notes with an optional title or archive flag. |
| notify | [notify](sh/notify) | — | — | — | Sends a desktop notification using notify-send or macOS scripting as fallbacks. |
| npm-repack | [npm-repack](sh/npm-repack) | — | — | — | Repackages an npm tarball with optimal gzip compression for size comparison. |
| npm-unused | [npm-unused](sh/npm-unused) | — | — | — | Reports npm dependencies that are not required anywhere in the repository. |
| npm-update-dependencies | [npm-update-dependencies](sh/npm-update-dependencies) | — | — | — | Updates package.json dependencies to their latest versions. |
| npm-update-dev-dependencies | [npm-update-dev-dependencies](sh/npm-update-dev-dependencies) | — | — | — | Updates package.json devDependencies to their latest versions. |
| ocr | [ocr](sh/ocr) | — | — | — | Performs OCR on an image using Apple's Vision framework and prints the recognized text. |
| pasta | [pasta](sh/pasta) | — | — | — | Prints clipboard contents with platform-specific fallbacks. |
| pastas | [pastas](sh/pastas) | — | — | — | Continuously prints clipboard changes until interrupted. |
| pingbing | [pingbing](sh/pingbing) | — | — | — | Pings duckduckgo.com once to check connectivity. |
| pingen | [pingen](sh/pingen) | [pingen.py](py/pingen.py) | [pingen.ps1](ps/pingen.ps1) | [pingen.cmd](cmd/pingen.cmd) | Generates a random numeric PIN of the requested length. |
| pix | [pix](sh/pix) | — | — | — | Displays images in mpv, looping each frame indefinitely. |
| prettypath | [prettypath](sh/prettypath) | — | — | — | Prints the PATH environment variable one directory per line. |
| radio | [radio](sh/radio) | — | — | — | Streams a preset internet radio station with mpv. |
| removeexif | [removeexif](sh/removeexif) | — | — | — | Strips EXIF metadata from JPEG images using jhead. |
| rn | [rn](sh/rn) | — | — | — | Shows the current time and today's calendar with the current date highlighted. |
| running | [running](sh/running) | — | — | — | Lists running processes, optionally filtering by a case-insensitive pattern. |
| scratch | [scratch](sh/scratch) | — | — | — | Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired. |
| serveit | [serveit](sh/serveit) | — | — | — | Starts a simple HTTP server in the current directory on the chosen port. |
| sfx | [sfx](sh/sfx) | — | — | — | Plays a named sound effect from the configured effects directory using mpv. |
| shrinkvid | [shrinkvid](sh/shrinkvid) | — | — | — | Re-encodes a video to H.264 with a chosen CRF for smaller output. |
| sleepybear | [sleepybear](sh/sleepybear) | — | — | — | Puts the computer to sleep using macOS or Linux commands. |
| snippet | [snippet](sh/snippet) | — | — | — | Shortcut that forwards arguments to the snippets helper command. |
| snippets | [snippets](sh/snippets) | — | — | — | Outputs a stored snippet file from ~/.config/evanhahn-snippets. |
| speak | [speak](sh/speak) | — | — | — | Speaks Markdown input aloud using say or espeak-ng if available. |
| stopwatch | [stopwatch](sh/stopwatch) | — | — | — | Measures elapsed time by timing stdin until EOF. |
| straightquote | [straightquote](sh/straightquote) | — | — | — | Converts curly quotes in the input to straight ASCII quotes. |
| theme | [theme](sh/theme) | — | — | — | Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments. |
| timer | [timer](sh/timer) | — | — | — | Sleeps for the specified duration then plays a sound and sends a notification. |
| transcribe | [transcribe](sh/transcribe) | — | — | — | Uses OpenAI Whisper to transcribe recordings or provided audio files. |
| trash | [trash](sh/trash) | — | — | — | Moves files to the system trash using Finder or gio depending on the platform. |
| treefind | [treefind](sh/treefind) | — | — | — | Runs tree and highlights matches for a pattern within a directory. |
| tryna | [tryna](sh/tryna) | — | — | — | Repeatedly runs a command until it succeeds. |
| trynafail | [trynafail](sh/trynafail) | — | — | — | Repeatedly runs a command until it fails. |
| tuivid | [tuivid](sh/tuivid) | — | — | — | Plays video in the terminal using mpv's tct video output. |
| tunes | [tunes](sh/tunes) | — | — | — | Streams audio-only playback via mpv, deferring to yt-dlp for URLs. |
| u+ | [u+](sh/u+) | — | — | — | Prints the Unicode character and name for a hexadecimal code point. |
| uppered | [uppered](sh/uppered) | [uppered.py](py/uppered.py) | [uppered.ps1](ps/uppered.ps1) | [uppered.cmd](cmd/uppered.cmd) | Converts stdin to uppercase characters. |
| upup | [upup](sh/upup) | — | — | — | Updates Homebrew and Flatpak packages if the tools are available. |
| url | [url](sh/url) | — | — | — | Parses a URL into its component parts and prints them. |
| url2md | [url2md](sh/url2md) | — | — | — | Fetches a web page via jina.ai and outputs Markdown-formatted content. |
| uuid | [uuid](sh/uuid) | [uuid.py](py/uuid.py) | [uuid.ps1](ps/uuid.ps1) | [uuid.cmd](cmd/uuid.cmd) | Generates a random UUID v4 and prints it. |
| view | [view](sh/view) | — | — | — | Opens the target file in read-only mode using the configured editor. |
| vimplug | [vimplug](sh/vimplug) | — | — | — | Downloads vim-plug into the appropriate autoload directory if missing. |
| waitfor | [waitfor](sh/waitfor) | — | — | — | Prevents sleep while waiting for a PID to exit using platform tools. |
| wifi | [wifi](sh/wifi) | — | — | — | Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS). |

Entries marked with — do not currently have a cross-platform rewrite because they rely on platform-specific tooling or interactive shell behavior.

## License

These scripts are available under the [MIT License](LICENSE). They were originally published in
[EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) under the
[Unlicense](https://codeberg.org/EvanHahn/dotfiles/src/branch/main/LICENSE.txt).
