# CLAUDE.md — JimmyTheHat Games Volunteer Program

## Project
Volunteer coordination hub for JimmyTheHat Games — onboarding docs, issue templates, and project info for the DrivingMeNuts racing game and future projects.

## Layout contract
- `docs/` — onboarding, legal, project, and role documentation
- `.github/ISSUE_TEMPLATE/` — volunteer application and question templates
- `.github/workflows/` — auto-response CI

## Multi-instance git protocol
Branch per task: `work/<topic>`. Parallel work in this clone → use a git worktree.
Stage only files YOU changed. Never `git add -A` / `git add .` / `commit -a`.
Unexplained dirty/untracked files: leave them, tell the owner.
Before pushing a shared branch: `git pull --rebase`; never force-push.

## Deploy
No deploy needed — this is a documentation/coordination repo.

## Test / Verify
Review new issue templates locally before committing. Check that all cross-references in docs resolve.
