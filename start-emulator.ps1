$adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
$emulatorId = "Medium_Phone_API_37.0"

Write-Host "Checking Android Emulator..."

$devices = & $adb devices

if ($devices -match "emulator-\d+\s+device") {
    Write-Host "Android Emulator is already running."
    exit 0
}

Write-Host "Starting Android Emulator..."

flutter emulators --launch $emulatorId

Write-Host "Waiting for Android Emulator..."

for ($i = 0; $i -lt 120; $i++) {
    Start-Sleep -Seconds 1

    $devices = & $adb devices

    if ($devices -match "emulator-\d+\s+device") {
        Write-Host "Android Emulator is ready."
        exit 0
    }

    Write-Host "Waiting... $($i + 1)s"
}

Write-Error "Android Emulator failed to start."
exit 1