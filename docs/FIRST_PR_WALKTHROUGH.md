# First-PR Walkthrough — Checklist

**Audience:** Newly accepted volunteers who want a tickable path to their first PR.  
**Companion to:** [`CONTRIBUTION_WORKFLOW.md`](CONTRIBUTION_WORKFLOW.md) (the full narrative).  
**Script:** [`scripts/first-pr-check.ps1`](../scripts/first-pr-check.ps1) verifies your local setup.

Use this as a working checklist. Mark each box as you go. If a step fails, stop and ask in Discussions — do not invent workarounds that skip mentor assignment.

---

## Before you start

- [ ] You have been **accepted** and accepted the GitHub org invite
- [ ] You can open [GitHub Discussions](https://github.com/subtiliorars-sys/jimmythehat-volunteers/discussions) (or Discord if your mentor directed you there)
- [ ] You enabled **2FA** on your GitHub account

---

## A. Local setup (developers)

> Artists / designers: skip to **B** if you are not cloning the game repo.

```powershell
# From any folder — clones Preview (public contribution target), not HQ
git clone https://github.com/subtiliorars-sys/DrivingMeNuts---Preview.git
cd DrivingMeNuts---Preview
npm install
npm start
```

- [ ] Clone is **`DrivingMeNuts---Preview`** (not the private HQ `DrivingMeNuts`)
- [ ] `npm install` completed without fatal errors
- [ ] `npm start` opens the game in a browser
- [ ] Optional: run the setup checker from this volunteers repo:

```powershell
# From jimmythehat-volunteers clone:
.\scripts\first-pr-check.ps1 -PreviewPath "C:\path\to\DrivingMeNuts---Preview"
```

---

## B. Pick and claim a task

- [ ] Open [`GOOD_FIRST_ISSUES.md`](GOOD_FIRST_ISSUES.md) and pick one task for your role
- [ ] If a live issue exists: comment `I'd like to claim this.` and wait for assignment
- [ ] If no live issue yet: ping a mentor (see [`SYNC_GOOD_FIRST_ISSUES.md`](SYNC_GOOD_FIRST_ISSUES.md)) — do not open a PR without a claimed issue
- [ ] Issue is **assigned to you** before you write code

---

## C. Branch → change → PR

```powershell
git checkout main
git pull
git checkout -b feature/short-task-name   # or fix/...
# ... edit only the files for your task ...
git add path\to\file1 path\to\file2       # never git add -A
git commit -m "fix: short description"
git push -u origin feature/short-task-name
```

- [ ] Branch name describes the task (`feature/...` or `fix/...`)
- [ ] Only your task files are staged
- [ ] PR targets `main` on **`DrivingMeNuts---Preview`**
- [ ] PR body links the issue (`Closes #NNN` or `Fixes #NNN`)
- [ ] Mentor review requested
- [ ] CI is green (or you posted what is failing)

---

## D. After merge

- [ ] PR merged by a maintainer (do not self-merge)
- [ ] Pick your next task from [`GOOD_FIRST_ISSUES.md`](GOOD_FIRST_ISSUES.md)

---

## Stuck?

| Symptom | What to do |
|---------|------------|
| Wrong repo / private clone fails | Use **Preview**; see [`projects/drivingmenuts.md`](projects/drivingmenuts.md) |
| No good-first issues open | Mentor sync — [`SYNC_GOOD_FIRST_ISSUES.md`](SYNC_GOOD_FIRST_ISSUES.md) |
| Build fails | Post in Discussions with the exact error + Node version |
| Unsure about the task | Comment on the issue; tag a mentor |

**Code of conduct:** [`onboarding/code-of-conduct.md`](onboarding/code-of-conduct.md)
