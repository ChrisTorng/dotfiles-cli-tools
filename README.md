# CLI Tools

A grab bag of small command-line helpers. Add \`sh/\` to your PATH or symlink the scripts you need.

These scripts are sourced from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) (`home/bin/bin`).
For a narrative tour of many of the tools, see the author's post
["Scripts I wrote that I use all the time"](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/).

## Scripts

- [alphabet](sh/alphabet) ([PowerShell](ps/alphabet.ps1)): Prints the lowercase and uppercase English alphabets for quick reference.
- [bb](sh/bb) ([PowerShell](ps/bb.ps1)): Runs a command in the background while silencing stdout/stderr if launched from a terminal.
- [bytedump](sh/bytedump) ([PowerShell](ps/bytedump.ps1)): Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal.
- [catbin](sh/catbin) ([PowerShell](ps/catbin.ps1)): Shows the contents of an executable found in your PATH using cat or bat.
- [clock](sh/clock) ([PowerShell](ps/clock.ps1)): Continuously displays the current time using watch.
- [cls](sh/cls) ([PowerShell](ps/cls.ps1)): Clears the current terminal screen.
- [copy](sh/copy) ([PowerShell](ps/copy.ps1)): Copies stdin or a file's contents to the system clipboard with several platform fallbacks.
- [cptmp](sh/cptmp) ([PowerShell](ps/cptmp.ps1)): Creates a temporary file path, prints it, and copies it to the clipboard.
- [cpwd](sh/cpwd) ([PowerShell](ps/cpwd.ps1)): Copies the current working directory path to the clipboard.
- [csv2md](sh/csv2md) ([PowerShell](ps/csv2md.ps1)): Converts a CSV file into a Markdown table printed to stdout.
- [datesort](sh/datesort) ([PowerShell](ps/datesort.ps1)): Suggests moves to organize files into year-based folders inferred from filenames.
- [ds-destroy](sh/ds-destroy) ([PowerShell](ps/ds-destroy.ps1)): Recursively removes .DS_Store files in the current directory tree.
- [duck](sh/duck) ([PowerShell](ps/duck.ps1)): Opens DuckDuckGo in the browser, optionally searching for the provided terms.
- [duckl](sh/duckl) ([PowerShell](ps/duckl.ps1)): Opens the lightweight DuckDuckGo interface with an optional search query.
- [each](sh/each) ([PowerShell](ps/each.ps1)): Runs a shell command for each line of stdin by replacing {} in the template.
- [emoji](sh/emoji) ([PowerShell](ps/emoji.ps1)): Lists emoji codes, optionally filtered by a case-insensitive search term.
- [extensions](sh/extensions) ([PowerShell](ps/extensions.ps1)): Prints unique file extensions from newline-delimited paths on stdin.
- [extract](sh/extract) ([PowerShell](ps/extract.ps1)): Extracts common archive formats into appropriately named directories.
- [f](sh/f) ([PowerShell](ps/f.ps1)): Shortcut for grep that forwards all arguments.
- [ffmpeg-smallest](sh/ffmpeg-smallest) ([PowerShell](ps/ffmpeg-smallest.ps1)): Transcodes a media file to several formats and keeps the smallest result.
- [flushdns](sh/flushdns) ([PowerShell](ps/flushdns.ps1)): Flushes the local DNS cache on supported systems (currently macOS).
- [g](sh/g) ([PowerShell](ps/g.ps1)): Runs git with the provided arguments, defaulting to git status.
- [getpod](sh/getpod) ([PowerShell](ps/getpod.ps1)): Downloads audio from online sources via yt-dlp with podcast-friendly settings.
- [getsong](sh/getsong) ([PowerShell](ps/getsong.ps1)): Fetches the best available audio stream via yt-dlp.
- [getsubs](sh/getsubs) ([PowerShell](ps/getsubs.ps1)): Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data.
- [git-fzf-checkout](sh/git-fzf-checkout) ([PowerShell](ps/git-fzf-checkout.ps1)): Uses fzf to interactively select and check out a git branch.
- [hoy](sh/hoy) ([PowerShell](ps/hoy.ps1)): Prints today's date in YYYY-MM-DD format without a trailing newline.
- [httpstatus](sh/httpstatus) ([PowerShell](ps/httpstatus.ps1)): Shows HTTP status codes and descriptions, optionally filtered by a pattern.
- [iclj](sh/iclj) ([PowerShell](ps/iclj.ps1)): Starts a Leiningen Clojure REPL in the current project.
- [ijs](sh/ijs) ([PowerShell](ps/ijs.ps1)): Opens an interactive JavaScript REPL using Deno, Node, or osascript.
- [iphp](sh/iphp) ([PowerShell](ps/iphp.ps1)): Launches the PHP interactive shell.
- [ipy](sh/ipy) ([PowerShell](ps/ipy.ps1)): Starts the Python interactive interpreter.
- [isql](sh/isql) ([PowerShell](ps/isql.ps1)): Opens an in-memory SQLite shell session.
- [jsonformat](sh/jsonformat) ([PowerShell](ps/jsonformat.ps1)): Pretty-prints JSON from stdin using node, jq, or cat as a fallback.
- [l](sh/l) ([PowerShell](ps/l.ps1)): Runs ls with the provided arguments.
- [la](sh/la) ([PowerShell](ps/la.ps1)): Runs ls -a with color flags appropriate for the current platform.
- [length](sh/length) ([PowerShell](ps/length.ps1)): Counts the number of characters in the provided arguments.
- [line](sh/line) ([PowerShell](ps/line.ps1)): Prints the Nth line from stdin.
- [list-colors](sh/list-colors) ([PowerShell](ps/list-colors.ps1)): Displays the 0-255 ANSI color codes.
- [lowered](sh/lowered) ([PowerShell](ps/lowered.ps1)): Converts stdin to lowercase characters.
- [markdownquote](sh/markdownquote) ([PowerShell](ps/markdownquote.ps1)): Wraps input in Markdown blockquote syntax while preserving blank lines.
- [math](sh/math) ([PowerShell](ps/math.ps1)): Opens a calculator REPL, preferring rink, then Python, then bc.
- [mergepdfs](sh/mergepdfs) ([PowerShell](ps/mergepdfs.ps1)): Merges multiple PDFs into a single file using Ghostscript.
- [mksh](sh/mksh) ([PowerShell](ps/mksh.ps1)): Creates an executable bash script template at the given path and opens it in $EDITOR.
- [movs2mp4s](sh/movs2mp4s) ([PowerShell](ps/movs2mp4s.ps1)): Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg.
- [murder](sh/murder) ([PowerShell](ps/murder.ps1)): Interactively kills processes by PID, name, or listening port with escalating signals.
- [myip](sh/myip) ([PowerShell](ps/myip.ps1)): Reports your local and/or public IP address.
- [nagd](sh/nagd) ([PowerShell](ps/nagd.ps1)): Sends a desktop notification every few minutes as a reminder.
- [nato](sh/nato) ([PowerShell](ps/nato.ps1)): Spells the supplied words using the NATO phonetic alphabet.
- [note](sh/note) ([PowerShell](ps/note.ps1)): Creates or opens a markdown note in ~/notes with an optional title or archive flag.
- [notify](sh/notify) ([PowerShell](ps/notify.ps1)): Sends a desktop notification using notify-send or macOS scripting as fallbacks.
- [npm-repack](sh/npm-repack) ([PowerShell](ps/npm-repack.ps1)): Repackages an npm tarball with optimal gzip compression for size comparison.
- [npm-unused](sh/npm-unused) ([PowerShell](ps/npm-unused.ps1)): Reports npm dependencies that are not required anywhere in the repository.
- [npm-update-dependencies](sh/npm-update-dependencies) ([PowerShell](ps/npm-update-dependencies.ps1)): Updates package.json dependencies to their latest versions.
- [npm-update-dev-dependencies](sh/npm-update-dev-dependencies) ([PowerShell](ps/npm-update-dev-dependencies.ps1)): Updates package.json devDependencies to their latest versions.
- [ocr](sh/ocr) ([PowerShell](ps/ocr.ps1)): Performs OCR on an image using Apple's Vision framework and prints the recognized text.
- [pasta](sh/pasta) ([PowerShell](ps/pasta.ps1)): Prints clipboard contents with platform-specific fallbacks.
- [pastas](sh/pastas) ([PowerShell](ps/pastas.ps1)): Continuously prints clipboard changes until interrupted.
- [pingbing](sh/pingbing) ([PowerShell](ps/pingbing.ps1)): Pings duckduckgo.com once to check connectivity.
- [pingen](sh/pingen) ([PowerShell](ps/pingen.ps1)): Generates a random numeric PIN of the requested length.
- [pix](sh/pix) ([PowerShell](ps/pix.ps1)): Displays images in mpv, looping each frame indefinitely.
- [prettypath](sh/prettypath) ([PowerShell](ps/prettypath.ps1)): Prints the PATH environment variable one directory per line.
- [radio](sh/radio) ([PowerShell](ps/radio.ps1)): Streams a preset internet radio station with mpv.
- [removeexif](sh/removeexif) ([PowerShell](ps/removeexif.ps1)): Strips EXIF metadata from JPEG images using jhead.
- [rn](sh/rn) ([PowerShell](ps/rn.ps1)): Shows the current time and today's calendar with the current date highlighted.
- [running](sh/running) ([PowerShell](ps/running.ps1)): Lists running processes, optionally filtering by a case-insensitive pattern.
- [scratch](sh/scratch) ([PowerShell](ps/scratch.ps1)): Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired.
- [serveit](sh/serveit) ([PowerShell](ps/serveit.ps1)): Starts a simple HTTP server in the current directory on the chosen port.
- [sfx](sh/sfx) ([PowerShell](ps/sfx.ps1)): Plays a named sound effect from the configured effects directory using mpv.
- [shrinkvid](sh/shrinkvid) ([PowerShell](ps/shrinkvid.ps1)): Re-encodes a video to H.264 with a chosen CRF for smaller output.
- [sleepybear](sh/sleepybear) ([PowerShell](ps/sleepybear.ps1)): Puts the computer to sleep using macOS or Linux commands.
- [snippet](sh/snippet) ([PowerShell](ps/snippet.ps1)): Shortcut that forwards arguments to the snippets helper command.
- [snippets](sh/snippets) ([PowerShell](ps/snippets.ps1)): Outputs a stored snippet file from ~/.config/evanhahn-snippets.
- [speak](sh/speak) ([PowerShell](ps/speak.ps1)): Speaks Markdown input aloud using say or espeak-ng if available.
- [stopwatch](sh/stopwatch) ([PowerShell](ps/stopwatch.ps1)): Measures elapsed time by timing stdin until EOF.
- [straightquote](sh/straightquote) ([PowerShell](ps/straightquote.ps1)): Converts curly quotes in the input to straight ASCII quotes.
- [theme](sh/theme) ([PowerShell](ps/theme.ps1)): Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments.
- [timer](sh/timer) ([PowerShell](ps/timer.ps1)): Sleeps for the specified duration then plays a sound and sends a notification.
- [transcribe](sh/transcribe) ([PowerShell](ps/transcribe.ps1)): Uses OpenAI Whisper to transcribe recordings or provided audio files.
- [trash](sh/trash) ([PowerShell](ps/trash.ps1)): Moves files to the system trash using Finder or gio depending on the platform.
- [treefind](sh/treefind) ([PowerShell](ps/treefind.ps1)): Runs tree and highlights matches for a pattern within a directory.
- [tryna](sh/tryna) ([PowerShell](ps/tryna.ps1)): Repeatedly runs a command until it succeeds.
- [trynafail](sh/trynafail) ([PowerShell](ps/trynafail.ps1)): Repeatedly runs a command until it fails.
- [tuivid](sh/tuivid) ([PowerShell](ps/tuivid.ps1)): Plays video in the terminal using mpv's tct video output.
- [tunes](sh/tunes) ([PowerShell](ps/tunes.ps1)): Streams audio-only playback via mpv, deferring to yt-dlp for URLs.
- [u+](sh/u+) ([PowerShell](ps/u+.ps1)): Prints the Unicode character and name for a hexadecimal code point.
- [uppered](sh/uppered) ([PowerShell](ps/uppered.ps1)): Converts stdin to uppercase characters.
- [upup](sh/upup) ([PowerShell](ps/upup.ps1)): Updates Homebrew and Flatpak packages if the tools are available.
- [url](sh/url) ([PowerShell](ps/url.ps1)): Parses a URL into its component parts and prints them.
- [url2md](sh/url2md) ([PowerShell](ps/url2md.ps1)): Fetches a web page via jina.ai and outputs Markdown-formatted content.
- [uuid](sh/uuid) ([PowerShell](ps/uuid.ps1)): Generates a random UUID v4 and prints it.
- [view](sh/view) ([PowerShell](ps/view.ps1)): Opens the target file in read-only mode using the configured editor.
- [vimplug](sh/vimplug) ([PowerShell](ps/vimplug.ps1)): Downloads vim-plug into the appropriate autoload directory if missing.
- [waitfor](sh/waitfor) ([PowerShell](ps/waitfor.ps1)): Prevents sleep while waiting for a PID to exit using platform tools.
- [wifi](sh/wifi) ([PowerShell](ps/wifi.ps1)): Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS).

## License

These scripts are available under the [MIT License](LICENSE). They were originally published in
[EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) under the
[Unlicense](https://codeberg.org/EvanHahn/dotfiles/src/branch/main/LICENSE.txt).
