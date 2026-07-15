# volunteer-pulse.ps1 - 15-minute heartbeat for the DrivingMeNuts volunteer-integration lane
# Posts a status comment to the kanban card so work stays visible when idle.
# Schedule (Task Scheduler, every 15 min): run powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<repo>\scripts\volunteer-pulse.ps1"
# Stop signal: if in-flight.md contains "stop the volunteer integration pulse", this no-ops and exits 0.

$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$Issue    = 'subtiliorars-sys/jimmythehat-volunteers#2'
$InFlight = Join-Path $RepoRoot '..\neural-network\handoffs\in-flight.md'

# Stop sentinel - honor an explicit halt without touching anything.
# To halt the pulse, add the token HEARTBEAT_HALT to handoffs/in-flight.md.
if (Test-Path $InFlight) {
    $text = Get-Content $InFlight -Raw -ErrorAction SilentlyContinue
    if ($text -match 'HEARTBEAT_HALT') {
        Write-Host 'Stop sentinel found - halting pulse.'
        exit 0
    }
}

# Build a short heartbeat from current git state.
Push-Location $RepoRoot
try {
    $branch = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    $status = (git status --porcelain 2>$null)
    if ($status) {
        $lines = ($status -split "`n" | Where-Object { $_.Trim() -ne '' }).Count
        $dirty = 'dirty ({0} files)' -f $lines
    } else {
        $dirty = 'clean'
    }
    $last = (git log -1 --format='%h %s' 2>$null).Trim()
} finally {
    Pop-Location
}

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
$body = @(
    "## Heartbeat - $timestamp",
    '',
    "- Lane: DrivingMeNuts volunteer integration ($Issue)",
    "- Branch: $branch",
    "- Tree: $dirty",
    "- Last commit: $last",
    "- Next: keep card in Review until owner merges PR #3."
) -join "`n"

# Post the heartbeat (requires gh auth). Fail soft so a scheduled task never errors out.
try {
    gh issue comment 2 --repo subtiliorars-sys/jimmythehat-volunteers --body $body | Out-Null
    Write-Host "Heartbeat posted at $timestamp"
} catch {
    Write-Warning "Heartbeat post failed (continuing): $_"
}
