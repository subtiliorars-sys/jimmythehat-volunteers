# Sync Checklist — Good First Issues ↔ DrivingMeNuts

**Problem:** Volunteers look here for "what can I pick up," but the live issues live in
`DrivingMeNuts---Preview`. When a new good-first-issue is created there (or here),
both sides must stay in sync or volunteers claim phantom work.

This doc defines a **manual checklist** (no automation dependency) plus an optional
**automation hook** for later.

---

## Canonical direction

```
jimmythehat-volunteers/docs/GOOD_FIRST_ISSUES.md   ⟵ source of truth (curated specs)
        │  (maintainer opens as live issue)
        ▼
DrivingMeNuts---Preview  Issues  (live, claimable)
```

The volunteer repo is the **catalog**; the game repo is where work actually happens.

---

## Manual checklist (run whenever issues change)

**When a new good-first-issue is opened in `DrivingMeNuts---Preview`:**
- [ ] Copy its title + number into `GOOD_FIRST_ISSUES.md` (move row from "Spec" → "Live").
- [ ] Add the same `good first issue` + role + type labels used here.
- [ ] Confirm the issue body follows the template in `GOOD_FIRST_ISSUES.md`.
- [ ] Post a one-line pointer in GitHub Discussions so volunteers see it.

**When an issue is claimed:**
- [ ] Maintainer assigns the volunteer on the issue (prevents double-claim).
- [ ] No change needed here — the assignee field is the live signal.

**When an issue is merged/closed:**
- [ ] Mark the row `Done` in `GOOD_FIRST_ISSUES.md` (or remove it).
- [ ] If it was the last open issue, add one fresh spec from the backlog so the list never goes empty.

**When a spec here has no live issue yet (common today):**
- [ ] Leave it in "Spec — open when ready" state.
- [ ] Volunteers ping a mentor; a maintainer opens it using the template.

---

## Optional automation (future)

A GitHub Action in `DrivingMeNuts---Preview` could, on `issues` `opened`/`closed`
labeled `good first issue`, post a summary comment linking back to
`jimmythehat-volunteers/docs/GOOD_FIRST_ISSUES.md`. Not required for the program to
function — the manual checklist above is sufficient and is the current process.

---

## Full-flow smoke test (run after any change)

1. A prospective volunteer opens the application template → submits. ✅ auto-response fires.
2. Mentor accepts → org invite + Discord. ✅
3. Volunteer runs `docs/onboarding/getting-started.md` → `npm start` launches. ✅
4. Volunteer reads `GOOD_FIRST_ISSUES.md` → picks a task. ✅
5. Volunteer comments to claim → maintainer assigns. ✅
6. Volunteer branches, builds, opens PR → CI green → mentor reviews → merge. ✅
7. Contribution credited in release notes. ✅

If any step can't complete, that step is the blocker to fix next — not the volunteer's fault.
