# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **cross-platform CLI utility collection** featuring 110+ small, single-responsibility command-line tools ported from [EvanHahn/dotfiles](https://codeberg.org/EvanHahn/dotfiles). Tools are implemented across multiple languages (Shell, Python, PowerShell, Windows CMD, and Rust) to support diverse user environments. The project follows Unix philosophy: each tool does one thing well.

## Repository Structure

```
dotfiles-cli-tools/
├── sh/                      # Bash implementations (95+ scripts)
├── py/                      # Python 3 implementations (95+ scripts)
├── ps/                      # PowerShell implementations (95+ scripts)
├── cmd/                     # Windows CMD implementations (34+ scripts)
```
rs/
    ├── Cargo.toml       # Workspace config
    └── crates/
        ├── clipboard-util/ # Shared library
        ├── cpy/             # Copy-to-clipboard binary
        └── pasta/           # Paste-from-clipboard binary
```
├── tests/                   # Test infrastructure
│   ├── sh/ShSpecTests/      # C# xUnit test runner
│   └── spec/                # BDD-style Gherkin specifications (90+ .feature files)
├── .github/workflows/       # CI/CD automation
└── README.md               # Comprehensive tool index (110+ tools)
```

## Common Development Commands

### Building

**Rust binaries:**
```bash
# Build release binaries for all crates
cd rs && cargo build --release --bins

# Build specific binary
To build a specific binary:

```bash
cd rs && cargo build --release --bin cpy
```

# Clean build artifacts
cd rs && cargo clean
```

### Testing

**Run specification conformance tests** (requires .NET 8.0):
```bash
cd tests/sh/ShSpecTests
dotnet test
```

The test framework:
- Loads BDD-style `.feature` files from `tests/spec/`
- Maps scenarios to shell script implementations
- Generates `spec-report.json` with results
- Validates behavioral consistency across platforms

**Running a single test scenario:**
Tests are parameterized by scenario, so filtering works by test name/feature:
```bash
cd tests/sh/ShSpecTests
dotnet test --filter "copy" # Run tests for copy feature
```

### Development Workflow

1. **Adding a new tool implementation:**
   - Create the script in the appropriate language directory (`sh/`, `py/`, `ps/`, `cmd/`, or `rs/`)
   - If adding a Rust binary, add it to the workspace by creating a new crate in `rs/crates/`
   - Create a `.feature` file in `tests/spec/` with BDD scenarios
   - Update `README.md` with tool description

2. **Testing new implementations:**
   - Write `.feature` files using Gherkin syntax for your scenarios
   - The test runner automatically discovers them in `tests/spec/`
   - Run `dotnet test` to validate all implementations

3. **Porting a tool to a new language:**
   - Implement the same functionality in the target language directory
   - Ensure it produces identical behavior to other implementations
   - All existing `.feature` files should pass for the tool

## Rust Workspace Details

**Location:** `rs/Cargo.toml`

**Workspace members:** `clipboard-util`, `cpy`, `pasta`

**Shared dependencies:**
- `anyhow`: Error handling with context chains
- `arboard`: Cross-platform clipboard access (Windows, macOS, Linux X11/Wayland)
- `clap`: CLI argument parsing with derive macros

**Architecture pattern:**
- `clipboard-util`: Library crate providing shared clipboard operations via `set_contents()` and `get_contents()`
- Binary crates (`cpy`, `pasta`) depend on the shared library
- Each binary has a `main.rs` with argument parsing and stdin/file handling

## Testing Architecture

**Test Framework:** xUnit (C# via .NET 8.0)

**Test Files:**
- `tests/sh/ShSpecTests/SpecConformanceTests.cs`: Main test class that executes all scenarios
- `tests/spec/*.feature`: Gherkin specifications for each tool
- `tests/sh/ShSpecTests/Specs/`: Scenario catalog and Gherkin parser
- `tests/sh/ShSpecTests/Runtime/`: Script execution engine

**Test Execution Flow:**
1. `SpecConformanceTests` loads `.feature` files via `SpecLoader`
2. `ScenarioCatalog` maps feature names to shell script paths
3. `ScriptRunner` executes scripts with arguments and captures output
4. Results are collected and persisted to `spec-report.json`

**Feature File Format (Gherkin):**
```gherkin
Feature: tool-name
  Brief description of functionality

  Scenario: scenario description
    Given preconditions
    When actions are performed
    Then expected outcomes
```

## CI/CD Pipeline

**File:** `.github/workflows/build-rs-tools.yml`

**Triggers:**
- Push to `main` branch
- Pull requests
- Tag push matching `v*` pattern

**Build matrix:**
- Ubuntu (produces Linux binaries)
- Windows (produces Windows `.exe` binaries)

**Release process:**
- Artifacts from all platforms automatically collected
- On version tags (`v*`), creates GitHub release with zipped binaries
- Separate archives: `dotfiles-cli-tools-linux.zip` and `dotfiles-cli-tools-windows.zip`

## Architecture Patterns

### Tool Implementation Across Languages

Each tool is semantically identical across implementations but optimized for the target environment:

**Shell scripts** (`sh/`):
- Direct execution via shebang
- Platform detection and fallback chains
- Example: `sh/copy` tries `pbcopy` → `xclip` → `wl-copy` → `putclip` → file fallback

**Python scripts** (`py/`):
- Shebang-based execution
- Cross-platform standard library usage
- Parameterized for maximum flexibility

**PowerShell scripts** (`ps/`):
- Parameter-based input handling
- Leverages native PowerShell cmdlets when available
- Falls back to external utilities

**Windows CMD** (`cmd/`):
- Batch file implementations
- Limited tool set (34 tools vs 95+ in other languages)

**Rust binaries** (`rs/`):
- Compiled for performance
- Shared library dependencies through workspace
- Modern error handling with context via `anyhow`
- Used for CPU-intensive or frequently-called tools (e.g., clipboard utilities)

### Clipboard Implementation

`clipboard-util` abstracts cross-platform differences:
- Windows: Uses native Win32 APIs via `arboard`
- macOS: Delegates to `pbcopy`/`pbpaste`
- Linux X11: Uses `xclip`
- Linux Wayland: Uses `wl-copy`/`wl-paste`
- Fallback: Temporary files in `/tmp/clipboard`

Both `cpy` (copy) and `pasta` (paste) binaries use this shared abstraction.

### Binary Crates

## Key Files and Concepts

- **`Cargo.toml`** (workspace): Central dependency management for all Rust crates
- **`Cargo.lock`**: Locks exact dependency versions for reproducible builds
- **`.gitignore`**: Excludes `rs/target/`, `rs/release/`, and test binaries
- **`cli-tools.sln`**: Visual Studio solution file for test infrastructure
- **`README.md`**: Complete tool reference with implementation status table

## Important Notes for Development

1. **Workspace Tooling:** The project uses .NET 8.0 for testing. Ensure `dotnet` is available when running tests.

2. **Cross-Platform Behavior:** Tools must behave identically across all implementations. The `.feature` files serve as the specification for this.

3. **Error Handling:** Rust code uses `anyhow::Result` for error propagation. Always provide context with `.context()`.

4. **Dependency Management:** Adding external dependencies to Rust crates should be done in `Cargo.toml` at the workspace level when shared, or in individual crate manifests when isolated.

5. **Testing New Tools:** Before merging, ensure:
   - All `.feature` file scenarios pass
   - Implementation exists for at least one language (preferably matching existing implementations)
   - `README.md` is updated with tool description
   - Commits reference the tool name (e.g., "feat(cpy): add verbose mode")

6. **Release Artifacts:** Only Rust binaries are released as GitHub releases. Script-based tools rely on users adding `sh/`, `py/`, `ps/`, or `cmd/` directories to their PATH.
