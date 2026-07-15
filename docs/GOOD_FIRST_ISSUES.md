# Good First Issues — DrivingMeNuts

**What this is:** A curated, role-sorted list of starter tasks volunteers can claim.
**Why it lives here:** The `DrivingMeNuts` HQ repo currently has **0 open issues**. Until
maintainers open these as live issues in `DrivingMeNuts---Preview`, this doc is the
single source of truth for "what can I pick up?"

**How to use it:**
1. Find a task for your role.
2. If the linked issue exists, comment `I'd like to claim this.`
3. If it does **not** exist yet, see [`SYNC_GOOD_FIRST_ISSUES.md`](SYNC_GOOD_FIRST_ISSUES.md) — ping a mentor and we'll open it.

---

## For Junior Developers (TypeScript)

| Task | Skill | Suggested label | Status |
|------|-------|-----------------|--------|
| Add a new power-up type (data + effect) | TS basics, data structures | `good first issue`, `enhancement` | Spec — open when ready |
| Fix a collision-detection edge case | TS, math | `good first issue`, `bug` | Spec — open when ready |
| Add a settings toggle (sound on/off) | TS, UI state | `good first issue`, `enhancement` | Spec — open when ready |
| Write a unit test for an existing helper | TS, vitest | `good first issue`, `tests` | Spec — open when ready |
| Improve an error message + add a guard | TS, defensive coding | `good first issue` | Spec — open when ready |

## For Artists (2D/3D)

| Task | Skill | Suggested label | Status |
|------|-------|-----------------|--------|
| Create a placeholder food-truck sprite variant | 2D pixel art | `good first issue`, `art` | Spec — open when ready |
| Design a track-banner UI element | UI art | `good first issue`, `art` | Spec — open when ready |
| Optimize an existing asset for web | Asset pipeline | `good first issue`, `art` | Spec — open when ready |

## For Designers

| Task | Skill | Suggested label | Status |
|------|-------|-----------------|--------|
| Document one game mechanic (GDD section) | Technical writing | `good first issue`, `docs` | Spec — open when ready |
| Write a level-layout brief for a new track | Level design | `good first issue`, `design` | Spec — open when ready |
| Draft a playtest feedback template | Process | `good first issue`, `docs` | Spec — open when ready |

---

## Issue template (paste when opening one)

```
Title: [Good First Issue] <short task>

Labels: good first issue, <role>, <type>

Body:
## What
<one sentence on what to build/fix>

## Why
<why it matters to the game/players>

## Acceptance
- [ ] <concrete, testable outcome>
- [ ] Builds and runs with `npm start`
- [ ] CI green

## For volunteers
- Role: <developer | artist | designer>
- Mentors: tag @<maintainer>
- Claim by commenting "I'd like to claim this."
```

---

**Maintainer note:** When you open one of these as a live issue, move its row to
"Live" and link the issue number. See [`SYNC_GOOD_FIRST_ISSUES.md`](SYNC_GOOD_FIRST_ISSUES.md).
