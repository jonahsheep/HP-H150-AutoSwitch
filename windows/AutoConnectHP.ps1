$deviceMAC = "XX:XX:XX:XX:XX:XX" # ← replace with your earbuds MAC


Add-Type -TypeDefinition @"
using System.Runtime.InteropServices;


public class AudioHelper {
[DllImport("winmm.dll")]
public static extern int waveOutGetNumDevs();
}
"@


$wasAudio = $false


while ($true) {


# Detect if any audio devices are active
$deviceCount = [AudioHelper]::waveOutGetNumDevs()


if ($deviceCount -gt 0 -and !$wasAudio) {
Write-Host "Audio started — connecting HP H150"
& bluetoothctl.exe -connect $deviceMAC
$wasAudio = $true
}


if ($deviceCount -eq 0 -and $wasAudio) {
Write-Host "Audio stopped"
$wasAudio = $false
}


Start-Sleep -Milliseconds 800
}
