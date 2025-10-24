# CLI Tools

A grab bag of small command-line helpers. Add \`sh/\` to your PATH or symlink the scripts you need.

These scripts are sourced from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) (`home/bin/bin`).
For a narrative tour of many of the tools, see the author's post
["Scripts I wrote that I use all the time"](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/).

## Scripts

| Tool | Shell | Python | PowerShell | CMD | Description |
| --- | --- | --- | --- | --- | --- |
| alphabet | [alphabet](sh/alphabet) | [alphabet.py](py/alphabet.py) | [alphabet.ps1](ps/alphabet.ps1) | [alphabet.cmd](cmd/alphabet.cmd) | Prints the lowercase and uppercase English alphabets for quick reference. |
| bb | [bb](sh/bb) | [bb.py](py/bb.py) | — | — | Runs a command in the background while silencing stdout/stderr if launched from a terminal. |
| bytedump | [bytedump](sh/bytedump) | [bytedump.py](py/bytedump.py) | — | — | Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal. |
| catbin | [catbin](sh/catbin) | [catbin.py](py/catbin.py) | — | — | Shows the contents of an executable found in your PATH using cat or bat. |
| clock | [clock](sh/clock) | [clock.py](py/clock.py) | — | — | Continuously displays the current time using watch. |
| cls | [cls](sh/cls) | [cls.py](py/cls.py) | — | — | Clears the current terminal screen. |
| copy | [copy](sh/copy) | [copy.py](py/copy.py) | — | — | Copies stdin or a file's contents to the system clipboard with several platform fallbacks. |
| cptmp | [cptmp](sh/cptmp) | [cptmp.py](py/cptmp.py) | — | — | Creates a temporary file path, prints it, and copies it to the clipboard. |
| cpwd | [cpwd](sh/cpwd) | [cpwd.py](py/cpwd.py) | — | — | Copies the current working directory path to the clipboard. |
| csv2md | [csv2md](sh/csv2md) | [csv2md.py](py/csv2md.py) | — | — | Converts a CSV file into a Markdown table printed to stdout. |
| datesort | [datesort](sh/datesort) | [datesort.py](py/datesort.py) | — | — | Suggests moves to organize files into year-based folders inferred from filenames. |
| ds-destroy | [ds-destroy](sh/ds-destroy) | [ds_destroy.py](py/ds_destroy.py) | — | — | Recursively removes .DS_Store files in the current directory tree. |
| duck | [duck](sh/duck) | [duck.py](py/duck.py) | — | — | Opens DuckDuckGo in the browser, optionally searching for the provided terms. |
| duckl | [duckl](sh/duckl) | [duckl.py](py/duckl.py) | — | — | Opens the lightweight DuckDuckGo interface with an optional search query. |
| each | [each](sh/each) | [each.py](py/each.py) | — | — | Runs a shell command for each line of stdin by replacing {} in the template. |
| emoji | [emoji](sh/emoji) | [emoji.py](py/emoji.py) | — | — | Lists emoji codes, optionally filtered by a case-insensitive search term. |
| extensions | [extensions](sh/extensions) | [extensions.py](py/extensions.py) | — | — | Prints unique file extensions from newline-delimited paths on stdin. |
| extract | [extract](sh/extract) | [extract.py](py/extract.py) | — | — | Extracts common archive formats into appropriately named directories. |
| f | [f](sh/f) | [f.py](py/f.py) | — | — | Shortcut for grep that forwards all arguments. |
| ffmpeg-smallest | [ffmpeg-smallest](sh/ffmpeg-smallest) | [ffmpeg_smallest.py](py/ffmpeg_smallest.py) | — | — | Transcodes a media file to several formats and keeps the smallest result. |
| flushdns | [flushdns](sh/flushdns) | [flushdns.py](py/flushdns.py) | — | — | Flushes the local DNS cache on supported systems (currently macOS). |
| g | [g](sh/g) | [g.py](py/g.py) | — | — | Runs git with the provided arguments, defaulting to git status. |
| getpod | [getpod](sh/getpod) | [getpod.py](py/getpod.py) | — | — | Downloads audio from online sources via yt-dlp with podcast-friendly settings. |
| getsong | [getsong](sh/getsong) | [getsong.py](py/getsong.py) | — | — | Fetches the best available audio stream via yt-dlp. |
| getsubs | [getsubs](sh/getsubs) | [getsubs.py](py/getsubs.py) | — | — | Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data. |
| git-fzf-checkout | [git-fzf-checkout](sh/git-fzf-checkout) | [git_fzf_checkout.py](py/git_fzf_checkout.py) | — | — | Uses fzf to interactively select and check out a git branch. |
| hoy | [hoy](sh/hoy) | [hoy.py](py/hoy.py) | [hoy.ps1](ps/hoy.ps1) | [hoy.cmd](cmd/hoy.cmd) | Prints today's date in YYYY-MM-DD format without a trailing newline. |
| httpstatus | [httpstatus](sh/httpstatus) | [httpstatus.py](py/httpstatus.py) | — | — | Shows HTTP status codes and descriptions, optionally filtered by a pattern. |
| iclj | [iclj](sh/iclj) | [iclj.py](py/iclj.py) | — | — | Starts a Leiningen Clojure REPL in the current project. |
| ijs | [ijs](sh/ijs) | [ijs.py](py/ijs.py) | — | — | Opens an interactive JavaScript REPL using Deno, Node, or osascript. |
| iphp | [iphp](sh/iphp) | [iphp.py](py/iphp.py) | — | — | Launches the PHP interactive shell. |
| ipy | [ipy](sh/ipy) | [ipy.py](py/ipy.py) | — | — | Starts the Python interactive interpreter. |
| isql | [isql](sh/isql) | [isql.py](py/isql.py) | — | — | Opens an in-memory SQLite shell session. |
| jsonformat | [jsonformat](sh/jsonformat) | [jsonformat.py](py/jsonformat.py) | — | — | Pretty-prints JSON from stdin using node, jq, or cat as a fallback. |
| l | [l](sh/l) | [l.py](py/l.py) | — | — | Runs ls with the provided arguments. |
| la | [la](sh/la) | [la.py](py/la.py) | — | — | Runs ls -a with color flags appropriate for the current platform. |
| length | [length](sh/length) | [length.py](py/length.py) | [length.ps1](ps/length.ps1) | [length.cmd](cmd/length.cmd) | Counts the number of characters in the provided arguments. |
| line | [line](sh/line) | [line.py](py/line.py) | [line.ps1](ps/line.ps1) | [line.cmd](cmd/line.cmd) | Prints the Nth line from stdin. |
| list-colors | [list-colors](sh/list-colors) | [list_colors.py](py/list_colors.py) | — | — | Displays the 0-255 ANSI color codes. |
| lowered | [lowered](sh/lowered) | [lowered.py](py/lowered.py) | [lowered.ps1](ps/lowered.ps1) | [lowered.cmd](cmd/lowered.cmd) | Converts stdin to lowercase characters. |
| markdownquote | [markdownquote](sh/markdownquote) | [markdownquote.py](py/markdownquote.py) | — | — | Wraps input in Markdown blockquote syntax while preserving blank lines. |
| math | [math](sh/math) | [math.py](py/math.py) | — | — | Opens a calculator REPL, preferring rink, then Python, then bc. |
| mergepdfs | [mergepdfs](sh/mergepdfs) | [mergepdfs.py](py/mergepdfs.py) | — | — | Merges multiple PDFs into a single file using Ghostscript. |
| mksh | [mksh](sh/mksh) | [mksh.py](py/mksh.py) | — | — | Creates an executable bash script template at the given path and opens it in $EDITOR. |
| movs2mp4s | [movs2mp4s](sh/movs2mp4s) | [movs2mp4s.py](py/movs2mp4s.py) | — | — | Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg. |
| murder | [murder](sh/murder) | [murder.py](py/murder.py) | — | — | Interactively kills processes by PID, name, or listening port with escalating signals. |
| myip | [myip](sh/myip) | [myip.py](py/myip.py) | — | — | Reports your local and/or public IP address. |
| nagd | [nagd](sh/nagd) | [nagd.py](py/nagd.py) | — | — | Sends a desktop notification every few minutes as a reminder. |
| nato | [nato](sh/nato) | [nato.py](py/nato.py) | [nato.ps1](ps/nato.ps1) | [nato.cmd](cmd/nato.cmd) | Spells the supplied words using the NATO phonetic alphabet. |
| note | [note](sh/note) | [note.py](py/note.py) | — | — | Creates or opens a markdown note in ~/notes with an optional title or archive flag. |
| notify | [notify](sh/notify) | [notify.py](py/notify.py) | — | — | Sends a desktop notification using notify-send or macOS scripting as fallbacks. |
| npm-repack | [npm-repack](sh/npm-repack) | [npm_repack.py](py/npm_repack.py) | — | — | Repackages an npm tarball with optimal gzip compression for size comparison. |
| npm-unused | [npm-unused](sh/npm-unused) | [npm_unused.py](py/npm_unused.py) | — | — | Reports npm dependencies that are not required anywhere in the repository. |
| npm-update-dependencies | [npm-update-dependencies](sh/npm-update-dependencies) | [npm_update_dependencies.py](py/npm_update_dependencies.py) | — | — | Updates package.json dependencies to their latest versions. |
| npm-update-dev-dependencies | [npm-update-dev-dependencies](sh/npm-update-dev-dependencies) | [npm_update_dev_dependencies.py](py/npm_update_dev_dependencies.py) | — | — | Updates package.json devDependencies to their latest versions. |
| ocr | [ocr](sh/ocr) | [ocr.py](py/ocr.py) | — | — | Performs OCR on an image using Apple's Vision framework and prints the recognized text. |
| pasta | [pasta](sh/pasta) | [pasta.py](py/pasta.py) | — | — | Prints clipboard contents with platform-specific fallbacks. |
| pastas | [pastas](sh/pastas) | [pastas.py](py/pastas.py) | — | — | Continuously prints clipboard changes until interrupted. |
| pingbing | [pingbing](sh/pingbing) | [pingbing.py](py/pingbing.py) | — | — | Pings duckduckgo.com once to check connectivity. |
| pingen | [pingen](sh/pingen) | [pingen.py](py/pingen.py) | [pingen.ps1](ps/pingen.ps1) | [pingen.cmd](cmd/pingen.cmd) | Generates a random numeric PIN of the requested length. |
| pix | [pix](sh/pix) | [pix.py](py/pix.py) | — | — | Displays images in mpv, looping each frame indefinitely. |
| prettypath | [prettypath](sh/prettypath) | [prettypath.py](py/prettypath.py) | — | — | Prints the PATH environment variable one directory per line. |
| radio | [radio](sh/radio) | [radio.py](py/radio.py) | — | — | Streams a preset internet radio station with mpv. |
| removeexif | [removeexif](sh/removeexif) | [removeexif.py](py/removeexif.py) | — | — | Strips EXIF metadata from JPEG images using jhead. |
| rn | [rn](sh/rn) | [rn.py](py/rn.py) | — | — | Shows the current time and today's calendar with the current date highlighted. |
| running | [running](sh/running) | [running.py](py/running.py) | — | — | Lists running processes, optionally filtering by a case-insensitive pattern. |
| scratch | [scratch](sh/scratch) | [scratch.py](py/scratch.py) | — | — | Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired. |
| serveit | [serveit](sh/serveit) | [serveit.py](py/serveit.py) | — | — | Starts a simple HTTP server in the current directory on the chosen port. |
| sfx | [sfx](sh/sfx) | [sfx.py](py/sfx.py) | — | — | Plays a named sound effect from the configured effects directory using mpv. |
| shrinkvid | [shrinkvid](sh/shrinkvid) | [shrinkvid.py](py/shrinkvid.py) | — | — | Re-encodes a video to H.264 with a chosen CRF for smaller output. |
| sleepybear | [sleepybear](sh/sleepybear) | [sleepybear.py](py/sleepybear.py) | — | — | Puts the computer to sleep using macOS or Linux commands. |
| snippet | [snippet](sh/snippet) | [snippet.py](py/snippet.py) | — | — | Shortcut that forwards arguments to the snippets helper command. |
| snippets | [snippets](sh/snippets) | [snippets.py](py/snippets.py) | — | — | Outputs a stored snippet file from ~/.config/evanhahn-snippets. |
| speak | [speak](sh/speak) | [speak.py](py/speak.py) | — | — | Speaks Markdown input aloud using say or espeak-ng if available. |
| stopwatch | [stopwatch](sh/stopwatch) | [stopwatch.py](py/stopwatch.py) | — | — | Measures elapsed time by timing stdin until EOF. |
| straightquote | [straightquote](sh/straightquote) | [straightquote.py](py/straightquote.py) | — | — | Converts curly quotes in the input to straight ASCII quotes. |
| theme | [theme](sh/theme) | [theme.py](py/theme.py) | — | — | Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments. |
| timer | [timer](sh/timer) | [timer.py](py/timer.py) | — | — | Sleeps for the specified duration then plays a sound and sends a notification. |
| transcribe | [transcribe](sh/transcribe) | [transcribe.py](py/transcribe.py) | — | — | Uses OpenAI Whisper to transcribe recordings or provided audio files. |
| trash | [trash](sh/trash) | [trash.py](py/trash.py) | — | — | Moves files to the system trash using Finder or gio depending on the platform. |
| treefind | [treefind](sh/treefind) | [treefind.py](py/treefind.py) | — | — | Runs tree and highlights matches for a pattern within a directory. |
| tryna | [tryna](sh/tryna) | [tryna.py](py/tryna.py) | — | — | Repeatedly runs a command until it succeeds. |
| trynafail | [trynafail](sh/trynafail) | [trynafail.py](py/trynafail.py) | — | — | Repeatedly runs a command until it fails. |
| tuivid | [tuivid](sh/tuivid) | [tuivid.py](py/tuivid.py) | — | — | Plays video in the terminal using mpv's tct video output. |
| tunes | [tunes](sh/tunes) | [tunes.py](py/tunes.py) | — | — | Streams audio-only playback via mpv, deferring to yt-dlp for URLs. |
| u+ | [u+](sh/u+) | [u_plus.py](py/u_plus.py) | — | — | Prints the Unicode character and name for a hexadecimal code point. |
| uppered | [uppered](sh/uppered) | [uppered.py](py/uppered.py) | [uppered.ps1](ps/uppered.ps1) | [uppered.cmd](cmd/uppered.cmd) | Converts stdin to uppercase characters. |
| upup | [upup](sh/upup) | [upup.py](py/upup.py) | — | — | Updates Homebrew and Flatpak packages if the tools are available. |
| url | [url](sh/url) | [url.py](py/url.py) | — | — | Parses a URL into its component parts and prints them. |
| url2md | [url2md](sh/url2md) | [url2md.py](py/url2md.py) | — | — | Fetches a web page via jina.ai and outputs Markdown-formatted content. |
| uuid | [uuid](sh/uuid) | [uuid.py](py/uuid.py) | [uuid.ps1](ps/uuid.ps1) | [uuid.cmd](cmd/uuid.cmd) | Generates a random UUID v4 and prints it. |
| view | [view](sh/view) | [view.py](py/view.py) | — | — | Opens the target file in read-only mode using the configured editor. |
| vimplug | [vimplug](sh/vimplug) | [vimplug.py](py/vimplug.py) | — | — | Downloads vim-plug into the appropriate autoload directory if missing. |
| waitfor | [waitfor](sh/waitfor) | [waitfor.py](py/waitfor.py) | — | — | Prevents sleep while waiting for a PID to exit using platform tools. |
| wifi | [wifi](sh/wifi) | [wifi.py](py/wifi.py) | — | — | Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS). |

Entries marked with — do not currently have a cross-platform rewrite because they rely on platform-specific tooling or interactive shell behavior.

## License

These scripts are available under the [MIT License](LICENSE). They were originally published in
[EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) under the
[Unlicense](https://codeberg.org/EvanHahn/dotfiles/src/branch/main/LICENSE.txt).
