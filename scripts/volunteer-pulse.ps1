# volunteer-pulse.ps1 — 15-minute heartbeat for the DrivingMeNuts volunteer-integration lane
#
# Purpose:
#   Post a heartbeat status comment to the kanban card so the work continues visibly
#   even when the driver isn't actively typing. Safe to run on a schedule.
#
# Schedule (Windows Task Scheduler, every 15 min):
#   Actions -> Start a program: powershell.exe
#   Arguments: -NoProfile -ExecutionPolicy Bypass -File "<repo>\scripts\volunteer-pulse.ps1"
#   Trigger: Daily, Repeat every 15 minutes, for 24 hours.
#
# Stop signal: the pulse checks in-flight.md for the sentinel string
#   "stop the volunteer integration pulse" — if present, it no-ops and exits 0.

$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$Issue   = 'subtiliorars-sys/jimmythehat-volunteers#2'
$InFlight = Join-Path $RepoRoot '..\neural-network\handoffs\in-flight.md'

# Stop sentinel — honor an explicit halt without touching anything.
if (Test-Path $InFlight) {
    $text = Get-Content $InFlight -Raw -ErrorAction SilentlyContinue
    if ($text -match 'stop the volunteer integration pulse') {
        Write-Host "Stop sentinel found — halting pulse."
        exit 0
    }
}

# Build a short heartbeat from current git state.
Push-Location $RepoRoot
try {
    $branch = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    $status = (git status --porcelain 2>$null)
    $dirty  = if ($status) { "dirty ($($status.Split("`n").Count) files)" } else { "clean" }
    $last   = (git log -1 --format='%h %s' 2>$null).Trim()
} finally {
    Pop-Location
}

$timestamp = (Get-Date -Format 'yyyy-MM-dd HH:mm')
$body = @"
## Heartbeat — $timestamp

- Lane: DrivingMeNuts volunteer integration ($Issue)
- Branch: $branch
- Tree: $dirty
- Last commit: $last
- Next: drive docs -> draft PR; keep card in In Progress until merged.
"@

# Post the heartbeat (requires gh auth). Fail soft so a scheduled task never errors out.
try {
    gh issue comment 2 --repo subtiliorars-sys/jimmythehat-volunteers --body $body | Out-Null
    Write-Host "Heartbeat posted at $timestamp"
} catch {
    Write-Warning "Heartbeat post failed (continuing): $_"
}
