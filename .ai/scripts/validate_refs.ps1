<#
.SYNOPSIS
  Validate cross-references across all .md files.
  Checks that referenced files actually exist.
#>

$ErrorActionPreference = "Continue"
$rootDir = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

# Collect all .md files
$mdFiles = Get-ChildItem -Path $rootDir -Recurse -Filter "*.md" | Where-Object { $_.FullName -notmatch 'node_modules|\.git' }

# Collect all file names for lookup
$allFiles = @{}
Get-ChildItem -Path $rootDir -Recurse -File | Where-Object { $_.FullName -notmatch 'node_modules|\.git|__pycache__|\.pytest_cache' } | ForEach-Object {
    $allFiles[$_.Name.ToLower()] = $_.FullName
}

$errors = 0

foreach ($file in $mdFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $relativePath = Resolve-Path -Path $file.FullName -RelativeBasePath $rootDir

    # Find markdown links: [text](path)
    $matches = [regex]::Matches($content, '\(([^)]+)\)')
    foreach ($m in $matches) {
        $ref = $m.Groups[1].Value.Trim()

        # Skip external URLs, anchors, mailto
        if ($ref -match '^(https?|mailto):|^#|^$') { continue }

        # Extract file name
        $refName = Split-Path -Leaf $ref -ErrorAction SilentlyContinue
        if (-not $refName) { continue }

        if (-not $allFiles.ContainsKey($refName.ToLower())) {
            Write-Warning "$relativePath : referenced file '$ref' not found"
            $errors++
        }
    }
}

if ($errors -gt 0) {
    Write-Host "FAILED: $errors broken reference(s) found." -ForegroundColor Red
    exit 1
} else {
    Write-Host "PASSED: All cross-references are valid." -ForegroundColor Green
    exit 0
}
