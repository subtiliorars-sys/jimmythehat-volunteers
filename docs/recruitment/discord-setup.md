# Discord Server Setup — Volunteer Comms

A volunteer Discord is the day-to-day hangout. GitHub Discussions stays the
documented Q&A surface; Discord is for quick chat and community.

## Create the server
1. New server → "From Scratch" → name: **JimmyTheHat Games Volunteers**.
2. Icon: use the project peanut/flag art (keep it on-brand, CC0 or house-made).

## Channels
| Channel | Purpose |
|---------|---------|
| `#welcome` | Auto-rules + "read before posting" |
| `#announcements` | Maintainer-only; release/event news |
| `#general` | Casual chat |
| `#dev-help` | Coding questions (TS, engine) |
| `#art-share` | Asset work-in-progress |
| `#design-talk` | Mechanics / GDD discussion |
| `#first-prs` | "I claimed X, here's my PR" check-ins |
| `#off-topic` | Non-work banter |

## Roles
| Role | Who | Permissions |
|------|-----|-------------|
| `Mentor` | Experienced devs/maintainers | Manage messages, pin, create invites |
| `Volunteer` | Accepted applicants | Send messages, attachments |
| `Bot` | Moderation/auto-response bot | Per bot defaults |

## Onboarding hook
- New joiner lands in `#welcome`; post the volunteer README + `docs/onboarding/getting-started.md`.
- Use a Discord welcome question or a bot rule: before chatting, they must have an
  accepted GitHub application (keeps the server to real volunteers).

## Invite
- Create a never-expiring (or rolling 7-day) invite with 1 use per person.
- Post the invite link in the introduction email (`intro-email.md`) and the README
  "How to Apply" section — not public subreddits (avoid drive-by spam).

## Moderation
- Enable Community + Rules screening.
- `docs/onboarding/code-of-conduct.md` is the enforced standard.
- Two-mentor consensus to remove a member.
