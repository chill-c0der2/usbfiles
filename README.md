
Here’s a simplified version of the steps in a clear and concise README.md format for your batch script:

Wi-Fi Network Host Discovery
This batch script allows you to scan your Wi-Fi network to find connected devices, including their IP addresses, MAC addresses, and (if possible) hostnames.

Requirements
Windows OS
Administrator privileges to run the script
Batch file execution enabled
Usage
Step 1: Determine Your Network Range
Open Command Prompt.
Run ipconfig to check your local IP address.
Note the IPv4 Address (e.g., 192.168.0.105). The first three parts (192.168.0.) define your network range.
Step 2: Modify the Script
Open the batch script file (find_hosts.bat) in a text editor.
Update the following line with your network range:
batch
Copy code
set baseip=192.168.0.
Replace 192.168.0. with your own network base IP.
