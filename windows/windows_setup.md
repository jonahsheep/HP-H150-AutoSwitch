# Windows Setup (How I Got It Working)

I made a small PowerShell script that watches for audio activity.
When Windows starts playing audio, it automatically fires a command to reconnect the HP H150.

## 1. Install Bluetooth Command Line Tools

I had to install this once:
```https://bluetoothinstaller.com/bluetooth-command-line-tools```
Reboot after installing.

## 2. Get Your Earbuds' MAC Address

This part confused me at first, but it’s easy:
- Connect your earbuds to Windows once.
- Open PowerShell and run:

```Get-PnpDevice -FriendlyName "*HP*" | Format-List```
- Look for a value like: 12:34:56:78:9C:BC
- Copy it, you’ll need it for the script.

## 3. Edit AutoConnectHP.ps1

- Go to: windows/AutoConnectHP.ps1
- Replace the placeholder MAC with yours.
- This script is the magic — it constantly listens for audio and auto-switches.

## 4. Run Automatically on Startup

I added it to startup so it works 24/7:
- Press Win + R
- Type: shell:startup

Drop a shortcut to the PowerShell script here.
Since then, my earbuds just “know” when to switch.
Maybe in the future can make this into a full fledged app
