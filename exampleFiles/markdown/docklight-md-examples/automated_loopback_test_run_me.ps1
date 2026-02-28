# run_automated_loopback_test.ps1
# ---------------------------------------------------------------
# PowerShell wrapper that runs the Docklight Scripting automated
# loopback test and evaluates the resulting log file.
#
# Usage:
#   .\run_automated_loopback_test.ps1
#   .\run_automated_loopback_test.ps1 -DocklightExe "C:\Program Files\Docklight\Docklight_Scripting.exe"
#
# Exit codes:
#   0 = all tests passed
#   1 = one or more tests failed or log evaluation error
# ---------------------------------------------------------------

param(
    [string]$DocklightExe = "..\..\..\Docklight_Scripting.exe",
    [string]$ProjectFile  = "automated_loopback_test.docklight.md",
    [string]$LogFile      = "automated_loopback_test_log_asc.txt",
    [int]$TimeoutSeconds  = 60
)

$ErrorActionPreference = "Stop"

# ---- Resolve paths --------------------------------------------------
$DocklightExe = Resolve-Path $DocklightExe -ErrorAction Stop
$ProjectFile  = Resolve-Path $ProjectFile  -ErrorAction Stop

# Remove old log file if present
if (Test-Path $LogFile) {
    Remove-Item $LogFile -Force
}

# ---- Run Docklight Scripting ----------------------------------------
Write-Host "Starting Docklight Scripting..."
Write-Host "  Executable : $DocklightExe"
Write-Host "  Project    : $ProjectFile"
Write-Host ""

$process = Start-Process -FilePath $DocklightExe `
                         -ArgumentList "-r", "`"$ProjectFile`"" `
                         -PassThru -NoNewWindow

# Wait for the process to exit (with timeout)
$exited = $process.WaitForExit($TimeoutSeconds * 1000)

if (-not $exited) {
    Write-Host "ERROR: Docklight Scripting did not exit within $TimeoutSeconds seconds." -ForegroundColor Red
    $process.Kill()
    exit 1
}

Write-Host "Docklight Scripting exited with code $($process.ExitCode)."
Write-Host ""

# ---- Evaluate log file ----------------------------------------------
if (-not (Test-Path $LogFile)) {
    Write-Host "ERROR: Log file not found: $LogFile" -ForegroundColor Red
    exit 1
}

Write-Host "Evaluating log file: $LogFile"
Write-Host "----------------------------------------"

$logContent = Get-Content $LogFile -Raw
Write-Host $logContent
Write-Host "----------------------------------------"

# Count PASS markers (from COMMENT strings in the log)
$passMatches = [regex]::Matches($logContent, "PASS - device command reaction OK")
$passCount   = $passMatches.Count

# Check for FAIL markers
$failMatches = [regex]::Matches($logContent, "FAIL - timeout waiting for echo")
$failCount   = $failMatches.Count

# Check for the overall summary line
$allPassed = $logContent -match "ALL TESTS PASSED"

Write-Host ""
Write-Host "Log evaluation results:"
Write-Host "  PASS comments found : $passCount"
Write-Host "  FAIL comments found : $failCount"
Write-Host "  ALL TESTS PASSED    : $allPassed"
Write-Host ""

if ($allPassed -and $failCount -eq 0 -and $passCount -gt 0) {
    Write-Host "RESULT: TEST PASSED" -ForegroundColor Green
    exit 0
} else {
    Write-Host "RESULT: TEST FAILED" -ForegroundColor Red
    exit 1
}
