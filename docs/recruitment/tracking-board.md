# Volunteer Tracking Board

We track volunteers on a simple Kanban (GitHub Projects or a spreadsheet — your call).
This spec defines the columns and the minimum fields so nothing falls through.

## Columns

| Column | Meaning |
|--------|---------|
| **Applied** | New volunteer-application issue, not yet reviewed |
| **Reviewing** | Mentor reading the app; consent requested if under 18 |
| **Accepted** | Approved; GitHub invite + intro email sent |
| **Onboarding** | Cloning repo, running `npm start`, claiming first task |
| **Active** | Has an assigned task / open PR |
| **Done** | First PR merged; credited |
| **Paused** | Stepped away (communicated) — can return |
| **Archived** | Left the project |

## Card fields (per volunteer)
- **Name / handle**
- **Role** (Junior Dev / Artist / Designer)
- **Age band** (note if parental consent needed)
- **Applied date**
- **GitHub handle** (assigned after accept)
- **First task** (issue link)
- **First PR** (link)
- **Mentor**
- **Notes** (timezone, interests, school-credit need)

## Spreadsheet option (quick start)
A single tab with one row per applicant and the columns above, plus a "Status"
dropdown driven by the column list. Good enough until volume justifies GitHub Projects.

## GitHub Projects option
- One board, one card per volunteer-application issue.
- Labels: `volunteer`, `role:dev`, `role:art`, `role:design`, `consent-needed`, `onboarded`.
- Move the card across columns as status changes.

## Weekly sweep
- [ ] Any `Applied` > 48h unreviewed? Review it.
- [ ] Any `Accepted` without an `Onboarding` start? Send a nudge.
- [ ] Any `Active` stuck > 1 week? Offer help / reassign.
- [ ] Count `Done` → feed the acceptance metric for issue #1 (need ≥ 3).
