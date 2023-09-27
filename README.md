# Windows Screen Lock with Activity Simulation

This PowerShell script allows you to specify a time when your Windows screen will automatically lock while keeping the system awake by simulating activity.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Customization](#customization)
- [License](#license)

## Features

- **Custom Lock Time:** You can set a specific time when the screen will lock.
- **Activity Simulation:** The script simulates key presses to keep the system awake until the specified lock time.
- **Flexible Configuration:** The script allows you to adjust the activity interval and key simulation if needed.

## Prerequisites

Before using this script, ensure you have the following prerequisites:

- **Windows Operating System:** This script is designed to run on Windows.
- **PowerShell:** PowerShell must be installed and enabled on your system.

## Usage

1. Clone or download this repository to your local machine.

2. Open a PowerShell terminal and navigate to the directory where you saved the script.

3. Run the script by executing the following command:

   ```powershell
   .\LockScreenAfterSimulation.ps1
