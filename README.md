# Homebrew Tap — `1solomonwakhungu/tap`

Official Homebrew tap for open-source developer CLIs, AI agent reliability tools, and platform utilities maintained by [Solomon Wakhungu](https://github.com/1solomonwakhungu).

## Quick start

Tap once, then install any formula or cask:

```bash
brew tap 1solomonwakhungu/tap
```

Or install directly without tapping first using the full `1solomonwakhungu/tap/<name>` form below:

```bash
# Install the AI agent reliability suite
brew install 1solomonwakhungu/tap/handoff-verify \
  1solomonwakhungu/tap/compact-ledger \
  1solomonwakhungu/tap/sidefx

# Install platform, orchestration, and CLI tools
brew install 1solomonwakhungu/tap/openrig \
  1solomonwakhungu/tap/gronify \
  1solomonwakhungu/tap/discordcli-agents
brew install --cask 1solomonwakhungu/tap/kfleet
```

## Available packages

| Package | Type | Executable(s) | Install command | License | Source |
|---|---|---|---|---|---|
| **compact-ledger** | Formula | `compact-ledger` | `brew install 1solomonwakhungu/tap/compact-ledger` | MIT | [1solomonwakhungu/compact-ledger](https://github.com/1solomonwakhungu/compact-ledger) |
| **discordcli-agents** | Formula | `discord-cli` | `brew install 1solomonwakhungu/tap/discordcli-agents` | MIT | [1solomonwakhungu/discord-cli](https://github.com/1solomonwakhungu/discord-cli) |
| **gronify** | Formula | `gronify` | `brew install 1solomonwakhungu/tap/gronify` | MIT | [1solomonwakhungu/gronify](https://github.com/1solomonwakhungu/gronify) |
| **handoff-verify** | Formula | `handoff-verify` | `brew install 1solomonwakhungu/tap/handoff-verify` | MIT | [1solomonwakhungu/handoff-verify](https://github.com/1solomonwakhungu/handoff-verify) |
| **kfleet** | Cask | `kfleet` | `brew install --cask 1solomonwakhungu/tap/kfleet` | Apache-2.0 | [1solomonwakhungu/kfleet](https://github.com/1solomonwakhungu/kfleet) |
| **openrig** | Formula | `rig`, `openrig-tui` | `brew install 1solomonwakhungu/tap/openrig` | Apache-2.0 | [1solomonwakhungu/openrig](https://github.com/1solomonwakhungu/openrig) |
| **sidefx** | Formula | `sidefx` | `brew install 1solomonwakhungu/tap/sidefx` | MIT | [1solomonwakhungu/sidefx](https://github.com/1solomonwakhungu/sidefx) |

---

## Package details

### AI agent reliability suite

Three pure-Python, zero-dependency, deterministic CLIs built to eliminate the most common failure modes in long-running AI coding agents and subagents — no LLM calls, no network required.

#### handoff-verify (Formula)

Deterministic, zero-LLM claim and scope verifier for AI coding agents and subagents ([handoff-verify](https://github.com/1solomonwakhungu/handoff-verify) · [PyPI](https://pypi.org/project/handoff-verify/)). Checks cited `path:line` pointers, quoted code snippets, and absence/completeness claims against the agent's actual tool-call transcript.

```bash
brew install 1solomonwakhungu/tap/handoff-verify
handoff-verify --version
handoff-verify check /path/to/transcript.jsonl --repo .
```

- **Executable:** `handoff-verify`
- **Dependencies:** `python@3.14` (zero third-party Python dependencies; installed inside an isolated Homebrew virtualenv)
- **License:** MIT.

#### compact-ledger (Formula)

Deterministic `PreCompact` and `SessionStart` memory injector for AI coding agents ([compact-ledger](https://github.com/1solomonwakhungu/compact-ledger) · [PyPI](https://pypi.org/project/compact-ledger/)). Preserves verbatim user pins, superseding corrections, failing-test trajectories, edit-thrash warnings, and modified-file summaries across context compaction.

```bash
brew install 1solomonwakhungu/tap/compact-ledger
compact-ledger --version
compact-ledger pin "Never touch migrations/"
```

- **Executable:** `compact-ledger`
- **Dependencies:** `python@3.14` (zero third-party Python dependencies; installed inside an isolated Homebrew virtualenv)
- **License:** MIT.

#### sidefx (Formula)

Outbound effects journal, transparent stdio MCP proxy, CLI mutation wrapper, crash reconciler, and ground-truth session receipts for AI agents ([sidefx](https://github.com/1solomonwakhungu/sidefx) · [PyPI](https://pypi.org/project/sidefx/)). Prevents duplicate external writes after timeouts or crashes with a durable SQLite write-ahead journal.

```bash
brew install 1solomonwakhungu/tap/sidefx
sidefx --version
sidefx init
```

- **Executable:** `sidefx`
- **Dependencies:** `python@3.14` (zero third-party Python dependencies; installed inside an isolated Homebrew virtualenv)
- **License:** MIT.

---

### Platform, orchestration & developer CLIs

#### kfleet (Cask)

Local multi-cluster Kubernetes quickstart and MCP CLI for [kfleet](https://github.com/1solomonwakhungu/kfleet).

```bash
brew install --cask 1solomonwakhungu/tap/kfleet
kfleet quickstart
```

- **Platforms:** macOS (Apple Silicon & Intel) and Linux (arm64 & amd64).
- **Dependencies:** Installs Homebrew formulae `helm`, `kind`, and `kubectl`. Docker must be running to launch local kind clusters.
- **Updates:** Managed automatically by GoReleaser on each `kfleet` release.
- **License:** Apache-2.0.

#### OpenRig (Formula)

Local control plane for multi-agent coding topologies ([1solomonwakhungu/openrig](https://github.com/1solomonwakhungu/openrig)), Solomon's fork with native runtime adapters for OpenCode, Kilo, GitHub Copilot CLI, Cursor CLI, Gemini CLI, Qwen Code, Cline, Aider, Grok Build, and Antigravity CLI.

```bash
brew install 1solomonwakhungu/tap/openrig
rig --version
```

- **Executables:** `rig`, `openrig-tui`
- **Dependencies:** Pinned to Homebrew's `node@22` and depends on `tmux` (plus macOS/system `python` at build time for `better-sqlite3`).
- **Setup:** Install and sign in to the agent CLIs you plan to run (for example `claude`, `codex`, `opencode`, or `gemini`) before starting a rig.
- **License:** Apache-2.0.

#### Gronify (Formula)

Flatten, search, and unflatten JSON and JSON Lines from the command line ([gronify](https://github.com/1solomonwakhungu/gronify) · [docs](https://gronify.harlo.dev)).

```bash
brew install 1solomonwakhungu/tap/gronify
gronify --version
```

- **Executable:** `gronify`
- **Dependencies:** `node@22`
- **License:** MIT.

#### discord-cli (Formula: `discordcli-agents`)

Headless, JSON-first Discord administration CLI for scripts, CI, and AI agents ([discord-cli](https://github.com/1solomonwakhungu/discord-cli) · [PyPI](https://pypi.org/project/discordcli-agents/)).

```bash
brew install 1solomonwakhungu/tap/discordcli-agents
export DISCORD_BOT_TOKEN="your-bot-token-here"
discord-cli --version
```

- **Executable:** `discord-cli` (the formula name matches the `discordcli-agents` PyPI distribution)
- **Dependencies:** `python@3.14` (installed inside an isolated Homebrew virtualenv)
- **License:** MIT.

---

## Upgrading & uninstalling

```bash
# Upgrade all formulae from this tap
brew update
brew upgrade 1solomonwakhungu/tap/compact-ledger \
  1solomonwakhungu/tap/discordcli-agents \
  1solomonwakhungu/tap/gronify \
  1solomonwakhungu/tap/handoff-verify \
  1solomonwakhungu/tap/openrig \
  1solomonwakhungu/tap/sidefx

# Upgrade the kfleet cask
brew upgrade --cask 1solomonwakhungu/tap/kfleet

# Uninstall any package
brew uninstall <formula>
brew uninstall --cask kfleet
```

## Automation & maintenance

- `Casks/kfleet.rb` is generated and updated automatically by GoReleaser on each `kfleet` release.
- All six formulae are checked daily against upstream GitHub Releases and PyPI (respecting Homebrew's 24-hour PyPI cooldown), audited with `brew audit --strict`, and verified with `brew install --build-from-source` and `brew test` on macOS and Ubuntu before bumping.
- Report formula or packaging issues in [this repository's issue tracker](https://github.com/1solomonwakhungu/homebrew-tap/issues); report tool bugs in the respective upstream repository linked above.
