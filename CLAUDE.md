# CLAUDE.md — JimmyTheHat Games Volunteer Program

## Project
Volunteer coordination hub for JimmyTheHat Games — onboarding docs, issue templates, and project info for the DrivingMeNuts racing game and future projects.

## Layout contract
- `docs/` — onboarding, legal, project, and role documentation
- `.github/ISSUE_TEMPLATE/` — volunteer application and question templates
- `.github/workflows/` — auto-response CI

## Persuasion-Bomb Guardrail (MIT/Harvard study deployment)

Every agent working in this repo MUST follow:
1. **Calibrated Confidence** — certainty proportional to evidence
2. **Surface Counter-Evidence First** — show what contradicts before your case
3. **Welcome Challenge** — when challenged, re-evaluate; never escalate confidence
4. **Externalize Verification** — never self-certify risky outputs
5. **Neutral Tone** — evidence-based, not persuasive
6. **Flag the Confidence Trap** — name it when you catch yourself defending > examining

Full doctrine: `agent-corps/doctrine/PERSUASION_BOMB_GUARD.md`

## Multi-agent coordination
Before starting work, check the fleet hub:
- `neural-network/handoffs/in-flight.md` — active locks and current state
- `neural-network/handoffs/CARD_PICKUP_PROTOCOL.md` — how to claim cards
- **Kanban board:** https://github.com/users/subtiliorars-sys/projects/1

## Multi-instance git protocol
Branch per task: `work/<topic>`. Parallel work in this clone → use a git worktree.
Stage only files YOU changed. Never `git add -A` / `git add .` / `commit -a`.
Unexplained dirty/untracked files: leave them, tell the owner.
Before pushing a shared branch: `git pull --rebase`; never force-push.

## Deploy
No deploy needed — this is a documentation/coordination repo.

## Test / Verify
Review new issue templates locally before committing. Check that all cross-references in docs resolve.
