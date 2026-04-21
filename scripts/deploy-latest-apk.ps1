param(
    [string]$RepoDir = "D:\Downloads\tap-n-eat-web",
    [string]$SourceDir = "D:\Downloads\Vibrant Community Marketplace App\exports\android\production",
    [string]$Branch = "main",
    [switch]$SkipPush
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Require-Path([string]$PathToCheck, [string]$Label) {
    if (-not (Test-Path -LiteralPath $PathToCheck)) {
        throw "$Label not found: $PathToCheck"
    }
}

Require-Path -PathToCheck $RepoDir -Label "Repo directory"
Require-Path -PathToCheck $SourceDir -Label "Source APK directory"

$latestApk = Get-ChildItem -LiteralPath $SourceDir -File -Filter "*.apk" |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $latestApk) {
    throw "No APK file found in source directory."
}

# Expected pattern: Tap-On-It-prod-v1.0.20260420.2217-2217.apk
if ($latestApk.Name -notmatch "^Tap-On-It-prod-v1\.0\.(?<date>\d{8})\.(?<time>\d{4})-.+\.apk$") {
    throw "Latest APK filename does not match expected pattern: $($latestApk.Name)"
}

$datePart = $Matches.date
$timePart = $Matches.time
$currentDownloadName = "TapOnIt-v1.0.$datePart-$timePart.apk"
$buildName = [System.IO.Path]::GetFileNameWithoutExtension($latestApk.Name)

$downloadsDir = Join-Path $RepoDir "downloads"
$apkVersionDir = Join-Path $downloadsDir "apk"
$latestJsonPath = Join-Path $downloadsDir "latest.json"
$indexPath = Join-Path $RepoDir "index.html"

Require-Path -PathToCheck $downloadsDir -Label "Downloads directory"
Require-Path -PathToCheck $apkVersionDir -Label "Versioned APK directory"
Require-Path -PathToCheck $latestJsonPath -Label "latest.json"
Require-Path -PathToCheck $indexPath -Label "index.html"

Push-Location $RepoDir
try {
    $statusOutput = git status --porcelain
    if ($LASTEXITCODE -ne 0) {
        throw "git status failed"
    }

    if ($statusOutput) {
        throw "Working tree is not clean. Commit or stash changes before deploying."
    }

    $latestMeta = Get-Content -LiteralPath $latestJsonPath -Raw | ConvertFrom-Json

    if ($latestMeta.buildName -eq $buildName) {
        Write-Host "Latest build is already deployed: $buildName"
        exit 0
    }

    $nextVersion = [int]$latestMeta.latestVersion + 1
    $versionedFileName = "TapNEat.v$nextVersion.apk"

    $directApkPath = Join-Path $downloadsDir $currentDownloadName
    $versionedApkPath = Join-Path $apkVersionDir $versionedFileName

    Copy-Item -LiteralPath $latestApk.FullName -Destination $directApkPath -Force
    Copy-Item -LiteralPath $latestApk.FullName -Destination $versionedApkPath -Force

    $publishedAt = ([DateTimeOffset]$latestApk.LastWriteTime).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:00.000Z")

    $newLatestMeta = [ordered]@{
        latestVersion   = $nextVersion
        latestFile      = "apk/$versionedFileName"
        currentDownload = $currentDownloadName
        buildName       = $buildName
        publishedAt     = $publishedAt
    }

    ($newLatestMeta | ConvertTo-Json -Depth 5) + "`n" | Set-Content -LiteralPath $latestJsonPath -Encoding UTF8

    $indexContent = Get-Content -LiteralPath $indexPath -Raw
    $updatedIndex = [Regex]::Replace(
        $indexContent,
        'href="downloads/TapOnIt-v1\.0\.[0-9]{8}-[0-9]{4}\.apk"',
        ('href="downloads/{0}"' -f $currentDownloadName),
        1
    )

    if ($updatedIndex -eq $indexContent) {
        throw "Could not find Android download link pattern in index.html"
    }

    Set-Content -LiteralPath $indexPath -Value $updatedIndex -Encoding UTF8

    git add $directApkPath $versionedApkPath $latestJsonPath $indexPath
    if ($LASTEXITCODE -ne 0) {
        throw "git add failed"
    }

    $commitMessage = "v${nextVersion}: deploy latest prod apk $($datePart.Substring(0,4))-$($datePart.Substring(4,2))-$($datePart.Substring(6,2))"
    git commit -m $commitMessage
    if ($LASTEXITCODE -ne 0) {
        throw "git commit failed"
    }

    if (-not $SkipPush) {
        git push origin $Branch
        if ($LASTEXITCODE -ne 0) {
            throw "git push failed"
        }
    }

    Write-Host "Deployed $buildName as v$nextVersion"
    if ($SkipPush) {
        Write-Host "Push skipped. Run: git push origin $Branch"
    }
}
finally {
    Pop-Location
}
