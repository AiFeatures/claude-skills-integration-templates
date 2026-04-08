# Fork Customizations

> Upstream: [calt13/claude-skills-integration-templates](https://github.com/calt13/claude-skills-integration-templates)
> Fork maintained by: @ashsolei
> Last reviewed: 2026-04-08
> Fork type: **light-customization**
> Sync cadence: **quarterly**

## Purpose of Fork

Claude Skills integration template fork used as reference by iAiFy skills work.

## Upstream Source

| Property | Value |
|---|---|
| Upstream | [calt13/claude-skills-integration-templates](https://github.com/calt13/claude-skills-integration-templates) |
| Fork org | AiFeatures |
| Fork type | light-customization |
| Sync cadence | quarterly |
| Owner | @ashsolei |

## Carried Patches

Local commits ahead of `upstream/main` at last review:

- `3d1305e chore(ci): adopt enterprise-ci-cd reusables (#3)`
- `ccb3cb6 docs: add iAiFy Fork Notes block to README (#2)`
- `b3cae1a chore: sync CLAUDE.md and copilot-instructions docs`
- `b4e8d94 docs: update FORK-CUSTOMIZATIONS.md with upstream source`
- `5a7eb6d docs: add FORK-CUSTOMIZATIONS.md per enterprise fork governance`
- `60fcccc ci: add copilot-setup-steps.yml for Copilot Workspace`
- `04eb1f6 chore: add CLAUDE.md`
- `8be5728 chore: add copilot-instructions.md`
- `0074436 chore: add Copilot Coding Agent setup steps`
- `a4267fa chore: remove misplaced agent files from .github/copilot/agents/`
- `8b892cc chore: deploy core custom agents from AgentHub`
- `f36ee17 chore: deploy core Copilot agents from AgentHub`
- `a61ab2d docs: add FORK-CUSTOMIZATIONS.md`
- `64239b5 chore: add dependabot.yml [governance-orchestrator]`
- `55d4eaa chore: add CODEOWNERS [governance-orchestrator]`

## Supported Components

- Root governance files (`.github/`, `CLAUDE.md`, `AGENTS.md`, `FORK-CUSTOMIZATIONS.md`)
- Enterprise CI/CD workflows imported from `Ai-road-4-You/enterprise-ci-cd`

## Out of Support

- All upstream source directories are tracked as upstream-of-record; local edits to core source are discouraged.

## Breaking-Change Policy

1. On upstream sync, classify per `governance/docs/fork-governance.md`.
2. Breaking API/license/security changes auto-classify as `manual-review-required`.
3. Owner triages within 5 business days; conflicts are logged to the `fork-sync-failure` issue label.
4. Revert local customizations only after stakeholder sign-off.

## Sync Strategy

This fork follows the [Fork Governance Policy](https://github.com/Ai-road-4-You/governance/blob/main/docs/fork-governance.md)
and the [Fork Upstream Merge Runbook](https://github.com/Ai-road-4-You/governance/blob/main/docs/runbooks/fork-upstream-merge.md).

- **Sync frequency**: quarterly
- **Conflict resolution**: Prefer upstream; reapply iAiFy customizations on a sync branch
- **Automation**: [`Ai-road-4-You/fork-sync`](https://github.com/Ai-road-4-You/fork-sync) workflows
- **Failure handling**: Sync failures create issues tagged `fork-sync-failure`

## Decision: Continue, Rebase, Refresh, or Replace

| Option | Current Assessment |
|---|---|
| Continue maintaining fork | yes - governance overlay only |
| Full rebase onto upstream | feasible on request |
| Fresh fork (discard local changes) | acceptable |
| Replace with upstream directly | possible |

## Maintenance

- **Owner**: @ashsolei
- **Last reviewed**: 2026-04-08
- **Reference runbook**: `ai-road-4-you/governance/docs/runbooks/fork-upstream-merge.md`
