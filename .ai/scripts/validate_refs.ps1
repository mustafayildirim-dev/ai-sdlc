<#
.SYNOPSIS
  Validate cross-references across all .md files.
  Checks that files referenced in markdown links [text](path) actually exist.
#>

$ErrorActionPreference = "Continue"
$rootDir = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

# Collect all .md files
$mdFiles = Get-ChildItem -Path $rootDir -Recurse -Filter "*.md" | Where-Object { $_.FullName -notmatch 'node_modules|\.git' }

# Build file name lookup
$allFiles = @{}
Get-ChildItem -Path $rootDir -Recurse -File | Where-Object { $_.FullName -notmatch 'node_modules|\.git|__pycache__|\.pytest_cache' } | ForEach-Object {
    $allFiles[$_.Name.ToLower()] = $_.FullName
}

$errors = 0

foreach ($file in $mdFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $relativePath = $file.FullName.Substring($rootDir.Length + 1)

    # Match markdown links: [text](path)
    $matches = [regex]::Matches($content, '\[([^\]]+)\]\(([^)]+)\)')
    foreach ($m in $matches) {
        $ref = $m.Groups[2].Value.Trim()

        # Skip external URLs, anchors, mailto
        if ($ref -match '^(https?|mailto):|^#') { continue }

        # Extract just the file name from the path
        $refName = Split-Path -Leaf $ref -ErrorAction SilentlyContinue
        if (-not $refName) { continue }

        if (-not $allFiles.ContainsKey($refName.ToLower())) {
            Write-Warning "$relativePath : link to '$ref' - file '$refName' not found in project"
            $errors++
        }
    }
}

if ($errors -gt 0) {
    Write-Host "FAILED: $errors broken reference(s) found." -ForegroundColor Red
    exit 1
}

Write-Host "PASSED: All cross-references are valid." -ForegroundColor Green
exit 0
