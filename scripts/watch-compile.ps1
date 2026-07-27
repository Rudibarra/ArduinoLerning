param(
  [string]$ProjectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$cli = Join-Path $ProjectRoot 'tools\arduino-cli\arduino-cli.exe'
$sketch = Join-Path $ProjectRoot 'Arduino-Learning-Wokwi.ino'

if (-not (Test-Path $cli)) {
  Write-Error "Arduino CLI not found at $cli"
  exit 1
}

if (-not (Test-Path $sketch)) {
  Write-Error "Sketch not found at $sketch"
  exit 1
}

function Invoke-ArduinoBuild {
  Write-Host ""
  Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Compiling Arduino sketch..." -ForegroundColor Cyan
  Push-Location $ProjectRoot
  try {
    & $cli compile --fqbn arduino:avr:uno --build-path build .
    if ($LASTEXITCODE -eq 0) {
      Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Compile complete. Restart Wokwi to use the new firmware." -ForegroundColor Green
    } else {
      Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Compile failed." -ForegroundColor Red
    }
  } finally {
    Pop-Location
  }
}

$lastWrite = (Get-Item $sketch).LastWriteTimeUtc
Write-Host "Watching Arduino-Learning-Wokwi.ino. Save the file to compile automatically." -ForegroundColor Yellow
Invoke-ArduinoBuild

while ($true) {
  Start-Sleep -Milliseconds 750
  $currentWrite = (Get-Item $sketch).LastWriteTimeUtc
  if ($currentWrite -ne $lastWrite) {
    $lastWrite = $currentWrite
    Start-Sleep -Milliseconds 350
    Invoke-ArduinoBuild
  }
}