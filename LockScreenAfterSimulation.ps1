# Prompt the user for the desired lock time
$lockTime = Read-Host "Enter the time to lock the screen (HH:mm)"

# Convert the input time to a DateTime object
$desiredLockTime = Get-Date $lockTime

# Calculate the number of seconds until the desired lock time
$secondsUntilLock = ($desiredLockTime - (Get-Date)).TotalSeconds

# Check if the input time is in the future
if ($secondsUntilLock -gt 0) {
    # Define a function for simulating key presses
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class KeyboardSimulator {
            [DllImport("user32.dll")]
            public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);

            public static void SimulateKeyPress(byte keyCode) {
                const int KEYEVENTF_KEYUP = 0x0002;
                keybd_event(keyCode, 0, 0, UIntPtr.Zero);
                keybd_event(keyCode, 0, KEYEVENTF_KEYUP, UIntPtr.Zero);
            }
        }
"@

    # Start the simulation activity (simulated key press every 5 minutes)
    $activityIntervalSeconds = 300  # Adjust this value as needed

    while ((Get-Date) -lt $desiredLockTime) {
        [KeyboardSimulator]::SimulateKeyPress(0x7E)  # Simulate the F13 key (0x7E)

        # Sleep for the specified interval
        Start-Sleep -Seconds $activityIntervalSeconds
    }

    # Lock the screen
    rundll32.exe user32.dll,LockWorkStation
}
else {
    Write-Host "Invalid input time. Please enter a time in the future."
}
