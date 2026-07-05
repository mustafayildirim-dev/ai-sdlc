<#
.SYNOPSIS
  Scan staged files for potential secrets, API keys, and sensitive data.
  Blocks commit if suspicious patterns are detected.
#>

$ErrorActionPreference = "Continue"
$rootDir = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

# Patterns that indicate secrets
$secretPatterns = @(
    '(?i)api.?key\s*[:=]\s*["'']?[A-Za-z0-9_\-]{16,}',
    '(?i)secret\s*[:=]\s*["'']?[A-Za-z0-9_\-]{8,}',
    '(?i)password\s*[:=]\s*["'']?.{6,}',
    '(?i)token\s*[:=]\s*["'']?[A-Za-z0-9_\-\.]{8,}',
    'sk-[A-Za-z0-9]{20,}',       # OpenAI key
    'gh[ps]_[A-Za-z0-9]{36}',    # GitHub token
    'AIza[0-9A-Za-z\-_]{35}',    # Google API key
    'AKIA[0-9A-Z]{16}'           # AWS access key
)

# File patterns that should never be committed
$blockedFiles = @(
    '\.env$',
    '\.env\.local$',
    '\.env\.development$',
    '\.env\.production$',
    '\*\.pem$',
    '\*\.key$',
    '\*\.cert$',
    'credentials\.json$',
    'service-account\.json$',
    'config\.json$'
)

$errors = 0

# Get staged files
$staged = git diff --cached --name-only

if (-not $staged) {
    Write-Host "No staged files to scan." -ForegroundColor Yellow
    exit 0
}

foreach ($file in $staged) {
    $fullPath = Join-Path $rootDir $file
    if (-not (Test-Path $fullPath)) { continue }

    # Check file name against blocked patterns
    foreach ($pattern in $blockedFiles) {
        if ($file -match $pattern) {
            Write-Warning "BLOCKED: '$file' matches blocked file pattern '$pattern'"
            $errors++
        }
    }

    # Check content for secret patterns (skip binary files)
    $ext = [System.IO.Path]::GetExtension($file)
    if ($ext -notin '.exe', '.dll', '.pyc', '.png', '.jpg', '.gif', '.ico', '.woff', '.woff2', '.ttf', '.eot') {
        $content = Get-Content -Path $fullPath -Raw -ErrorAction SilentlyContinue
        if ($content) {
            foreach ($pattern in $secretPatterns) {
                if ($content -match $pattern) {
                    Write-Warning "BLOCKED: '$file' matches secret pattern in content (line $($matches[0]))"
                    $errors++
                }
            }
        }
    }
}

if ($errors -gt 0) {
    Write-Host "FAILED: $errors secret(s) detected. Commit blocked." -ForegroundColor Red
    Write-Host "Remove the flagged content or add to .gitignore before committing." -ForegroundColor Yellow
    exit 1
}

Write-Host "PASSED: No secrets detected in staged files." -ForegroundColor Green
exit 0
