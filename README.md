# CLI Tools

A grab bag of small command-line helpers. Add \`sh/\` to your PATH or symlink the scripts you need.

These scripts are sourced from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) (`home/bin/bin`).
For a narrative tour of many of the tools, see the author's post
["Scripts I wrote that I use all the time"](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/).

## Scripts

- [alphabet](sh/alphabet): Prints the lowercase and uppercase English alphabets for quick reference.
- [bb](sh/bb): Runs a command in the background while silencing stdout/stderr if launched from a terminal.
- [bytedump](sh/bytedump): Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal.
- [catbin](sh/catbin): Shows the contents of an executable found in your PATH using cat or bat.
- [clock](sh/clock): Continuously displays the current time using watch.
- [cls](sh/cls): Clears the current terminal screen.
- [copy](sh/copy): Copies stdin or a file's contents to the system clipboard with several platform fallbacks.
- [cptmp](sh/cptmp): Creates a temporary file path, prints it, and copies it to the clipboard.
- [cpwd](sh/cpwd): Copies the current working directory path to the clipboard.
- [csv2md](sh/csv2md): Converts a CSV file into a Markdown table printed to stdout.
- [datesort](sh/datesort): Suggests moves to organize files into year-based folders inferred from filenames.
- [ds-destroy](sh/ds-destroy): Recursively removes .DS_Store files in the current directory tree.
- [duck](sh/duck): Opens DuckDuckGo in the browser, optionally searching for the provided terms.
- [duckl](sh/duckl): Opens the lightweight DuckDuckGo interface with an optional search query.
- [each](sh/each): Runs a shell command for each line of stdin by replacing {} in the template.
- [emoji](sh/emoji): Lists emoji codes, optionally filtered by a case-insensitive search term.
- [extensions](sh/extensions): Prints unique file extensions from newline-delimited paths on stdin.
- [extract](sh/extract): Extracts common archive formats into appropriately named directories.
- [f](sh/f): Shortcut for grep that forwards all arguments.
- [ffmpeg-smallest](sh/ffmpeg-smallest): Transcodes a media file to several formats and keeps the smallest result.
- [flushdns](sh/flushdns): Flushes the local DNS cache on supported systems (currently macOS).
- [g](sh/g): Runs git with the provided arguments, defaulting to git status.
- [getpod](sh/getpod): Downloads audio from online sources via yt-dlp with podcast-friendly settings.
- [getsong](sh/getsong): Fetches the best available audio stream via yt-dlp.
- [getsubs](sh/getsubs): Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data.
- [git-fzf-checkout](sh/git-fzf-checkout): Uses fzf to interactively select and check out a git branch.
- [hoy](sh/hoy): Prints today's date in YYYY-MM-DD format without a trailing newline.
- [httpstatus](sh/httpstatus): Shows HTTP status codes and descriptions, optionally filtered by a pattern.
- [iclj](sh/iclj): Starts a Leiningen Clojure REPL in the current project.
- [ijs](sh/ijs): Opens an interactive JavaScript REPL using Deno, Node, or osascript.
- [iphp](sh/iphp): Launches the PHP interactive shell.
- [ipy](sh/ipy): Starts the Python interactive interpreter.
- [isql](sh/isql): Opens an in-memory SQLite shell session.
- [jsonformat](sh/jsonformat): Pretty-prints JSON from stdin using node, jq, or cat as a fallback.
- [l](sh/l): Runs ls with the provided arguments.
- [la](sh/la): Runs ls -a with color flags appropriate for the current platform.
- [length](sh/length): Counts the number of characters in the provided arguments.
- [line](sh/line): Prints the Nth line from stdin.
- [list-colors](sh/list-colors): Displays the 0-255 ANSI color codes.
- [lowered](sh/lowered): Converts stdin to lowercase characters.
- [markdownquote](sh/markdownquote): Wraps input in Markdown blockquote syntax while preserving blank lines.
- [math](sh/math): Opens a calculator REPL, preferring rink, then Python, then bc.
- [mergepdfs](sh/mergepdfs): Merges multiple PDFs into a single file using Ghostscript.
- [mksh](sh/mksh): Creates an executable bash script template at the given path and opens it in $EDITOR.
- [movs2mp4s](sh/movs2mp4s): Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg.
- [murder](sh/murder): Interactively kills processes by PID, name, or listening port with escalating signals.
- [myip](sh/myip): Reports your local and/or public IP address.
- [nagd](sh/nagd): Sends a desktop notification every few minutes as a reminder.
- [nato](sh/nato): Spells the supplied words using the NATO phonetic alphabet.
- [note](sh/note): Creates or opens a markdown note in ~/notes with an optional title or archive flag.
- [notify](sh/notify): Sends a desktop notification using notify-send or macOS scripting as fallbacks.
- [npm-repack](sh/npm-repack): Repackages an npm tarball with optimal gzip compression for size comparison.
- [npm-unused](sh/npm-unused): Reports npm dependencies that are not required anywhere in the repository.
- [npm-update-dependencies](sh/npm-update-dependencies): Updates package.json dependencies to their latest versions.
- [npm-update-dev-dependencies](sh/npm-update-dev-dependencies): Updates package.json devDependencies to their latest versions.
- [ocr](sh/ocr): Performs OCR on an image using Apple's Vision framework and prints the recognized text.
- [pasta](sh/pasta): Prints clipboard contents with platform-specific fallbacks.
- [pastas](sh/pastas): Continuously prints clipboard changes until interrupted.
- [pingbing](sh/pingbing): Pings duckduckgo.com once to check connectivity.
- [pingen](sh/pingen): Generates a random numeric PIN of the requested length.
- [pix](sh/pix): Displays images in mpv, looping each frame indefinitely.
- [prettypath](sh/prettypath): Prints the PATH environment variable one directory per line.
- [radio](sh/radio): Streams a preset internet radio station with mpv.
- [removeexif](sh/removeexif): Strips EXIF metadata from JPEG images using jhead.
- [rn](sh/rn): Shows the current time and today's calendar with the current date highlighted.
- [running](sh/running): Lists running processes, optionally filtering by a case-insensitive pattern.
- [scratch](sh/scratch): Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired.
- [serveit](sh/serveit): Starts a simple HTTP server in the current directory on the chosen port.
- [sfx](sh/sfx): Plays a named sound effect from the configured effects directory using mpv.
- [shrinkvid](sh/shrinkvid): Re-encodes a video to H.264 with a chosen CRF for smaller output.
- [sleepybear](sh/sleepybear): Puts the computer to sleep using macOS or Linux commands.
- [snippet](sh/snippet): Shortcut that forwards arguments to the snippets helper command.
- [snippets](sh/snippets): Outputs a stored snippet file from ~/.config/evanhahn-snippets.
- [speak](sh/speak): Speaks Markdown input aloud using say or espeak-ng if available.
- [stopwatch](sh/stopwatch): Measures elapsed time by timing stdin until EOF.
- [straightquote](sh/straightquote): Converts curly quotes in the input to straight ASCII quotes.
- [theme](sh/theme): Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments.
- [timer](sh/timer): Sleeps for the specified duration then plays a sound and sends a notification.
- [transcribe](sh/transcribe): Uses OpenAI Whisper to transcribe recordings or provided audio files.
- [trash](sh/trash): Moves files to the system trash using Finder or gio depending on the platform.
- [treefind](sh/treefind): Runs tree and highlights matches for a pattern within a directory.
- [tryna](sh/tryna): Repeatedly runs a command until it succeeds.
- [trynafail](sh/trynafail): Repeatedly runs a command until it fails.
- [tuivid](sh/tuivid): Plays video in the terminal using mpv's tct video output.
- [tunes](sh/tunes): Streams audio-only playback via mpv, deferring to yt-dlp for URLs.
- [u+](sh/u+): Prints the Unicode character and name for a hexadecimal code point.
- [uppered](sh/uppered): Converts stdin to uppercase characters.
- [upup](sh/upup): Updates Homebrew and Flatpak packages if the tools are available.
- [url](sh/url): Parses a URL into its component parts and prints them.
- [url2md](sh/url2md): Fetches a web page via jina.ai and outputs Markdown-formatted content.
- [uuid](sh/uuid): Generates a random UUID v4 and prints it.
- [view](sh/view): Opens the target file in read-only mode using the configured editor.
- [vimplug](sh/vimplug): Downloads vim-plug into the appropriate autoload directory if missing.
- [waitfor](sh/waitfor): Prevents sleep while waiting for a PID to exit using platform tools.
- [wifi](sh/wifi): Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS).

## License

These scripts are available under the [MIT License](LICENSE). They were originally published in
[EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles) under the
[Unlicense](https://codeberg.org/EvanHahn/dotfiles/src/branch/main/LICENSE.txt).
