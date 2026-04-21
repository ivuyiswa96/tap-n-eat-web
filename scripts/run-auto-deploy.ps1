$ErrorActionPreference = "Stop"

Set-Location "D:\Downloads\tap-n-eat-web"

$logPath = "D:\Downloads\tap-n-eat-web\logs\auto-deploy.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

"[$timestamp] Auto-deploy task started" | Out-File -FilePath $logPath -Append -Encoding utf8

try {
    .\scripts\deploy-latest-apk.ps1 *>> $logPath
    "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Auto-deploy task finished successfully" | Out-File -FilePath $logPath -Append -Encoding utf8
}
catch {
    "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Auto-deploy task failed: $($_.Exception.Message)" | Out-File -FilePath $logPath -Append -Encoding utf8
    throw
}
