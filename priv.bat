# Retr0's PowerShell System Information Script
# This script gathers system info for educational purposes only!

Write-Host "[*] Gathering System Information..."

# Get OS details
$os = Get-CimInstance Win32_OperatingSystem
Write-Host "[*] Operating System: $($os.Caption)"
Write-Host "[*] Version: $($os.Version)"
Write-Host "[*] Build Number: $($os.BuildNumber)"

# Get CPU details
$cpu = Get-CimInstance Win32_Processor
Write-Host "[*] CPU: $($cpu.Name)"
Write-Host "[*] Cores: $($cpu.NumberOfCores)"

# Get memory details
$mem = Get-CimInstance Win32_PhysicalMemory
$totalMemory = 0
foreach ($module in $mem) {
    $totalMemory += $module.Capacity
}
$totalMemoryGB = [math]::round($totalMemory / 1GB, 2)
Write-Host "[*] Total Memory: $totalMemoryGB GB"

# List installed software
Write-Host "[*] Installed Software:"
Get-WmiObject -Class Win32_Product | Select-Object -Property Name | Format-Table -AutoSize

# Final message
Write-Host "[*] System Information Gathering Complete!"
