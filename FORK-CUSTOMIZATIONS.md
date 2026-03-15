# Fork Customizations

> This repository is a fork of [calt13/claude-skills-integration-templates](https://github.com/calt13/claude-skills-integration-templates).
> Managed under the [iAiFy Enterprise](https://github.com/enterprises/iAiFy) governance model.

## Purpose

Drop-in Markdown snippets that enable any Agent CLI to discover and use Claude Skills — even if you primarily use a different CLI than Claude Code.

## Upstream Source

| Property | Value |
|----------|-------|
| Upstream | [calt13/claude-skills-integration-templates](https://github.com/calt13/claude-skills-integration-templates) |
| Language | N/A |
| Fork org | AiFeatures |

## Local Customizations

<!-- Document any local changes made to this fork below -->

| Change | Files affected | Reason |
|--------|----------------|--------|
| Enterprise governance files | `.github/`, `CLAUDE.md`, `AGENTS.md` | iAiFy enterprise standard |
| Copilot setup | `.github/copilot-setup-steps.yml` | Enterprise Copilot configuration |
| CodeQL scanning | `.github/workflows/codeql.yml` | Enterprise security baseline |

## Sync Strategy

This fork follows the [Fork Governance Policy](https://github.com/Ai-road-4-You/governance/blob/main/docs/fork-governance.md).

- **Sync frequency**: Monthly (via [fork-sync](https://github.com/Ai-road-4-You/fork-sync))
- **Conflict resolution**: Prefer upstream, reapply local customizations
- **Breaking changes**: Review upstream releases before syncing

## Maintenance

- **Owner**: @ashsolei
- **Last synced**: _Not yet synced_
- **Last reviewed**: _Not yet reviewed_
