# Contribution Workflow — Application to First PR

**Audience:** Newly accepted volunteers (developers, artists, designers) for DrivingMeNuts.
**Goal:** Walk a volunteer from "I just applied" to "my first pull request is merged," with no guessing.

This is the canonical path. If anything here is unclear, open a [Question issue](https://github.com/subtiliorars-sys/jimmythehat-volunteers/issues/new?template=question.yml).

---

## The 6-step path

```
[1] Apply ──▶ [2] Accept + setup ──▶ [3] Onboard ──▶ [4] Claim an issue ──▶ [5] Build + PR ──▶ [6] Merge + retro
```

| # | Phase | Owner | Where | Exit criteria |
|---|-------|-------|-------|---------------|
| 1 | Apply | Volunteer | Volunteer application issue | Application submitted |
| 2 | Accept + setup | Mentor | Email + GitHub invite | Repo access granted, channels joined |
| 3 | Onboard | Volunteer | `docs/onboarding/getting-started.md` | Env builds, `npm start` runs |
| 4 | Claim an issue | Volunteer | DrivingMeNuts (or `DrivingMeNuts---Preview`) | Issue assigned to you |
| 5 | Build + PR | Volunteer | Local branch → PR | PR open, CI green, review requested |
| 6 | Merge + retro | Mentor | GitHub | PR merged, contribution credited |

---

## Step 1 — Apply

1. Open the [Volunteer Application](https://github.com/subtiliorars-sys/jimmythehat-volunteers/issues/new?template=volunteer-application.yml) template.
2. Fill in role, experience, availability, and a link to your portfolio/GitHub if you have one.
3. Submit. You'll get a confirmation from the auto-response workflow.

> Under 18? Leave the age field accurate — we send a parental consent form before step 2.

## Step 2 — Accept + Setup (within 48h)

1. **Email review** — a mentor reviews your application.
2. **Org invite** — you receive a GitHub organization invitation; accept it.
3. **Channels** — join GitHub Discussions (primary) and Discord (if applicable).
4. **If under 18** — return the signed parental consent form.

## Step 3 — Onboard (your first week)

Follow [`docs/onboarding/getting-started.md`](onboarding/getting-started.md) end to end:

```bash
git clone https://github.com/subtiliorars-sys/DrivingMeNuts---Preview.git
cd DrivingMeNuts---Preview
npm install
npm start          # opens the game in your browser
```

- Set up 2FA on GitHub.
- Introduce yourself in Discussions.
- Confirm `npm start` actually launches the game.

> **Repo note:** `DrivingMeNuts` (HQ) is the private design-doc repo. Public, contribution-ready code lives in **`DrivingMeNuts---Preview`**. Unless a mentor tells you otherwise, you clone and PR against the **Preview** repo. See [`docs/projects/drivingmenuts.md`](projects/drivingmenuts.md).

## Step 4 — Claim an issue

1. Go to the good-first-issues list: [`docs/GOOD_FIRST_ISSUES.md`](GOOD_FIRST_ISSUES.md).
2. Pick one that matches your role and interest.
3. Comment on the linked issue: `I'd like to claim this.` 
4. Wait for a maintainer to assign it to you (so two people don't duplicate work).

> If the issue doesn't exist yet in the repo, that's expected — see the sync checklist in [`docs/SYNC_GOOD_FIRST_ISSUES.md`](SYNC_GOOD_FIRST_ISSUES.md). Ping a mentor and we'll open it.

## Step 5 — Build + open a PR

```bash
git checkout -b feature/your-task-name   # or fix/your-task-name
# ... make your change, test it ...
git add <specific files>                  # never `git add -A`
git commit -m "fix: short description of the change"
git pull --rebase origin main            # stay current
git push -u origin feature/your-task-name
```

Then on GitHub:
1. Open a pull request against `main`.
2. Fill in the PR template; link the issue (`Closes #NNN`).
3. Request review from a mentor.
4. Watch CI — fix anything red.

## Step 6 — Merge + retro

1. Mentor reviews; you address feedback (push follow-up commits — don't force-push).
2. Once approved, a maintainer merges.
3. Your name is added to release notes / contributors.
4. You pick your next issue from [`docs/GOOD_FIRST_ISSUES.md`](GOOD_FIRST_ISSUES.md).

---

## Need help?

- **Stuck on code?** Search existing issues, then post in Discussions with what you tried.
- **Unclear task?** Comment on the issue and tag a mentor.
- **No time?** Tell us early — communication beats silence.

**Full code of conduct:** [`docs/onboarding/code-of-conduct.md`](onboarding/code-of-conduct.md)
