# Launch Notes — Unified Developer & AI Agent Tooling Tap

Concise release and announcement copy for `brew tap 1solomonwakhungu/tap`.

---

## GitHub Release / Changelog Copy

### What's new in `1solomonwakhungu/homebrew-tap`

`brew tap 1solomonwakhungu/tap` now ships the complete developer and AI-agent CLI suite in one Homebrew tap — including three new zero-dependency, deterministic agent reliability tools alongside `openrig`, `kfleet`, `gronify`, and `discordcli-agents`:

- **`handoff-verify`** (`v0.1.0`) — Deterministic, zero-LLM claim and scope verifier for AI coding agents and subagents. Checks cited `path:line` pointers, quoted snippets, and absence/completeness claims against tool-call transcripts.
- **`compact-ledger`** (`v0.1.0`) — Deterministic `PreCompact` and `SessionStart` memory injector that preserves verbatim user pins, superseding corrections, failing-test trajectories, and edit-thrash warnings across compaction.
- **`sidefx`** (`v0.1.0`) — Outbound effects journal, transparent stdio MCP proxy, CLI mutation wrapper, crash reconciler, and ground-truth session receipts backed by SQLite WAL.

#### Install

```bash
brew tap 1solomonwakhungu/tap

# AI agent reliability suite
brew install handoff-verify compact-ledger sidefx

# Platform, orchestration & utility CLIs
brew install openrig gronify discordcli-agents
brew install --cask kfleet
```

#### Packaging & CI

- Every formula is audited with `brew audit --strict` and verified from source (`brew install --build-from-source` + `brew test`) on both `macos-15` and `ubuntu-24.04`.
- Automated daily upstream checks keep all six formulae synced with PyPI and GitHub Releases, while `Casks/kfleet.rb` updates automatically via GoReleaser.

---

## Short Social / Announcement Copy

Shipped the full AI-agent & developer CLI suite to one Homebrew tap:

```bash
brew tap 1solomonwakhungu/tap
brew install handoff-verify compact-ledger sidefx openrig gronify discordcli-agents
brew install --cask kfleet
```

Three deterministic, zero-LLM, zero-dependency Python CLIs (`handoff-verify`, `compact-ledger`, `sidefx`) for verifiable agent handoffs, compaction-proof pins, and idempotent external writes — plus `openrig`, `kfleet`, `gronify`, and `discord-cli`, all tested end-to-end on macOS and Linux.

Repository: https://github.com/1solomonwakhungu/homebrew-tap
