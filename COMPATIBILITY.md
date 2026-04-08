# Compatibility Matrix

Which templates work with which agent environments. Update this file any time a new template is added or a new agent CLI is verified.

## Template × Agent CLI

| Template | Claude Code | Codex CLI | Gemini CLI | Kimi CLI | GitHub Copilot Agent |
|---|:---:|:---:|:---:|:---:|:---:|
| `templates/generic` | ✅ | ✅ | ✅ | ✅ | ⚠️ |

Legend:
- ✅ Verified: template produces discoverable skills without modification
- ⚠️ Partial: works with caveats — see notes below
- ❌ Incompatible
- — Not yet tested

## Notes

### `templates/generic`
- **Claude Code**: native skill discovery from `~/.claude/skills/` and `.claude/skills/`
- **Codex CLI**: discovered via the AGENTS.md hint that points at `~/.claude/plugins/marketplaces/` — see `sample/skill-discovery-response/codex.md`
- **Gemini CLI**: works when `~/.agent/skills/` is populated and referenced from `GEMINI.md`
- **Kimi CLI**: works via the same neutral `~/.agent/skills/` path — see `sample/skill-discovery-response/kimi.md`
- **GitHub Copilot Agent**: partial — skills load but the agent does not re-scan mid-session; users must restart after adding new skills

## Verification Checklist

When adding a new row to the matrix:

1. Install the template into a scratch workspace
2. Launch the target agent CLI with the template's AGENTS.md present
3. Ask the agent to list discoverable skills
4. Confirm at least one skill from `~/.claude/skills/` or `~/.agent/skills/` is returned
5. Record the agent CLI version in the notes section

## Unsupported Environments

The following environments are **not** currently targeted by any template in this repo:

- JetBrains AI Assistant (proprietary skill discovery)
- Cursor (uses `.cursorrules` rather than AGENTS.md)
- Continue.dev (custom config format)

If you want support for one of these, open an issue with a proposed template layout.
