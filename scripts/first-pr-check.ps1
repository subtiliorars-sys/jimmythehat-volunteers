# First-PR local setup checker
# Verifies a volunteer's DrivingMeNuts---Preview clone is ready for a first PR.
# Usage:
#   .\scripts\first-pr-check.ps1
#   .\scripts\first-pr-check.ps1 -PreviewPath "C:\dev\DrivingMeNuts---Preview"

param(
    [string]$PreviewPath = ""
)

$ErrorActionPreference = "Continue"
$failed = 0

function Ok($msg)  { Write-Host "[OK]  $msg" -ForegroundColor Green }
function Warn($msg){ Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Bad($msg) { Write-Host "[FAIL] $msg" -ForegroundColor Red; $script:failed++ }

Write-Host "`n=== First-PR setup check ===`n" -ForegroundColor Cyan

# Resolve Preview path
if (-not $PreviewPath) {
    $candidates = @(
        (Join-Path (Split-Path $PSScriptRoot -Parent) "..\DrivingMeNuts---Preview"),
        (Join-Path $env:USERPROFILE "repos\DrivingMeNuts---Preview"),
        (Join-Path $env:USERPROFILE "projects\claude\DrivingMeNuts---Preview")
    ) | ForEach-Object { [IO.Path]::GetFullPath($_) }

    foreach ($c in $candidates) {
        if (Test-Path (Join-Path $c "package.json")) {
            $PreviewPath = $c
            break
        }
    }
}

if (-not $PreviewPath -or -not (Test-Path $PreviewPath)) {
    Bad "Could not find DrivingMeNuts---Preview. Pass -PreviewPath or clone it first:"
    Write-Host "  git clone https://github.com/subtiliorars-sys/DrivingMeNuts---Preview.git"
    exit 1
}

Ok "Preview path: $PreviewPath"

Push-Location $PreviewPath
try {
    # Repo identity
    $remote = git remote get-url origin 2>$null
    if ($remote -match "DrivingMeNuts---Preview") {
        Ok "Remote points at Preview (contribution target)"
    } elseif ($remote -match "DrivingMeNuts") {
        Bad "Remote looks like HQ DrivingMeNuts, not Preview. Clone Preview instead."
        Write-Host "  Remote: $remote"
    } else {
        Warn "Unexpected remote: $remote"
    }

    # package.json + node_modules
    if (Test-Path "package.json") { Ok "package.json present" } else { Bad "package.json missing" }
    if (Test-Path "node_modules") { Ok "node_modules present (npm install done)" }
    else { Warn "node_modules missing — run: npm install" }

    # Node / npm
    $node = Get-Command node -ErrorAction SilentlyContinue
    $npm  = Get-Command npm  -ErrorAction SilentlyContinue
    if ($node) { Ok "node: $(node -v)" } else { Bad "node not on PATH" }
    if ($npm)  { Ok "npm:  $(npm -v)" }  else { Bad "npm not on PATH" }

    # Git hygiene hints
    $branch = git branch --show-current 2>$null
    if ($branch) { Ok "Current branch: $branch" }
    $dirty = git status --porcelain 2>$null
    if ($dirty) { Warn "Working tree has local changes — fine if intentional" }
    else { Ok "Working tree clean" }

} finally {
    Pop-Location
}

Write-Host ""
if ($failed -eq 0) {
    Write-Host "Ready for the checklist: docs/FIRST_PR_WALKTHROUGH.md" -ForegroundColor Green
    Write-Host "Next: claim a task from docs/GOOD_FIRST_ISSUES.md" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host "$failed check(s) failed. Fix those before opening a PR." -ForegroundColor Red
    exit 1
}
