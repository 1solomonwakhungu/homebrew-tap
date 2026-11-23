# Homebrew Tap — `1solomonwakhungu/tap`

Official Homebrew tap for open-source CLIs and platform tools maintained by [Solomon Wakhungu](https://github.com/1solomonwakhungu).

## Quick start

Tap once, then install any formula or cask:

```bash
brew tap 1solomonwakhungu/tap
```

Or install directly without tapping first using the full `1solomonwakhungu/tap/<name>` form below.

## Available packages

| Package | Type | Executable(s) | Install command | Source |
|---|---|---|---|---|
| **kfleet** | Cask | `kfleet` | `brew install --cask 1solomonwakhungu/tap/kfleet` | [1solomonwakhungu/kfleet](https://github.com/1solomonwakhungu/kfleet) |
| **gronify** | Formula | `gronify` | `brew install 1solomonwakhungu/tap/gronify` | [1solomonwakhungu/gronify](https://github.com/1solomonwakhungu/gronify) |
| **discordcli-agents** | Formula | `discord-cli` | `brew install 1solomonwakhungu/tap/discordcli-agents` | [1solomonwakhungu/discord-cli](https://github.com/1solomonwakhungu/discord-cli) |
| **openrig** | Formula | `rig`, `openrig-tui` | `brew install 1solomonwakhungu/tap/openrig` | [1solomonwakhungu/openrig](https://github.com/1solomonwakhungu/openrig) |

---

## Package details

### kfleet (Cask)

Local multi-cluster Kubernetes quickstart and management CLI for [kfleet](https://github.com/1solomonwakhungu/kfleet).

```bash
brew install --cask 1solomonwakhungu/tap/kfleet
kfleet quickstart
```

- **Platforms:** macOS (Apple Silicon & Intel) and Linux (arm64 & amd64).
- **Dependencies:** Installs Homebrew formulae `helm`, `kind`, and `kubectl`. Docker must be running to launch local kind clusters.
- **Updates:** Managed automatically by GoReleaser on each `kfleet` release.
- **License:** Apache-2.0.

### Gronify (Formula)

Flatten, search, and unflatten JSON and JSON Lines from the command line ([gronify](https://github.com/1solomonwakhungu/gronify) · [docs](https://gronify.harlo.dev)).

```bash
brew install 1solomonwakhungu/tap/gronify
gronify --version
```

- **Executable:** `gronify`
- **Dependencies:** `node@22`
- **License:** MIT.

### discord-cli (Formula: `discordcli-agents`)

Headless, JSON-first Discord administration CLI for scripts, CI, and AI agents ([discord-cli](https://github.com/1solomonwakhungu/discord-cli) · [PyPI](https://pypi.org/project/discordcli-agents/)).

```bash
brew install 1solomonwakhungu/tap/discordcli-agents
export DISCORD_BOT_TOKEN="your-bot-token-here"
discord-cli --version
```

- **Executable:** `discord-cli` (the formula name matches the `discordcli-agents` PyPI distribution)
- **Dependencies:** `python@3.14` (installed inside an isolated Homebrew virtualenv)
- **License:** MIT.

### OpenRig (Formula)

Local control plane for multi-agent coding topologies ([1solomonwakhungu/openrig](https://github.com/1solomonwakhungu/openrig)), Solomon's fork with native runtime adapters for OpenCode, Kilo, GitHub Copilot CLI, Cursor CLI, Gemini CLI, Qwen Code, Cline, Aider, Grok Build, and Antigravity CLI.

```bash
brew install 1solomonwakhungu/tap/openrig
rig --version
```

- **Executables:** `rig`, `openrig-tui`
- **Dependencies:** Pinned to Homebrew's `node@22` and depends on `tmux` (plus macOS/system `python` at build time for `better-sqlite3`).
- **Setup:** Install and sign in to the agent CLIs you plan to run (for example `claude`, `codex`, `opencode`, or `gemini`) before starting a rig.
- **License:** Apache-2.0.

---

## Upgrading & uninstalling

```bash
# Upgrade formulae
brew update
brew upgrade 1solomonwakhungu/tap/gronify 1solomonwakhungu/tap/discordcli-agents 1solomonwakhungu/tap/openrig

# Upgrade the kfleet cask
brew upgrade --cask 1solomonwakhungu/tap/kfleet

# Uninstall any package
brew uninstall <formula>
brew uninstall --cask kfleet
```

## Automation & maintenance

- `Casks/kfleet.rb` is generated and updated automatically by GoReleaser on each `kfleet` release.
- Formulae are checked daily against upstream releases and verified with `brew test` in CI before bumping.
- Report formula or packaging issues in [this repository's issue tracker](https://github.com/1solomonwakhungu/homebrew-tap/issues); report tool bugs in the respective upstream repository linked above.
