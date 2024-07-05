@echo off

REM Windows Secunetcon

REM Network Settings
ipconfig /release REM Release IP address
ipconfig /renew REM Renew IP address
netsh interface ipv4 set address name="Ethernet" static 127.0.0.1 REM Assign IPv4 localhost address
netsh interface ipv6 set address name="Ethernet" static ::1 REM Assign IPv6 localhost address
netsh interface ipv4 set dns name="Ethernet" source=static addr=127.0.0.1 register=none REM Set primary DNS to IPv4 localhost address
netsh interface ipv6 set dns name="Ethernet" source=static addr=::1 register=none REM Set secondary DNS to IPv6 localhost address

REM Hostname
powershell -Command "Rename-Computer -NewName 'localhost'" REM Change hostname to IPv4 localhost address

REM MAC Address
reg add ".\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\." /v NetworkAddress /d "000000000000" /f REM Change MAC address to all zeros

REM Bluetooth Address
reg add ".\SYSTEM\CurrentControlSet\Services\.\Parameters\Keys\." /v Name /d "localhost" /f REM Change Bluetooth name to localhost
reg add ".\SYSTEM\CurrentControlSet\Services\.\Parameters\keys\." /v EnableLMPiscan /d 1 /t REG_DWORD /f REM Enable Bluetooth discovery

REM Location Services
net stop "SensorDataService" REM Disable location services

REM Firewall
netsh advfirewall firewall add rule name="Block ICMP" protocol=icmpv4:any,any action=block REM Close pings
netsh advfirewall set allprofiles firewallpolicy blockinbound REM Block all ingress traffic

REM Browser Cleanup
start chrome --clear-ssl-state --incognito REM Clear browser cookies and cache for Chrome
start firefox --no-remote -ProfileManager REM Clear browser cookies and cache for Firefox
start brave --clear-browsing-data REM Clear browser cookies and cache for Brave
start vivaldi --clearprivatedata REM Clear browser cookies and cache for Vivaldi
start msedge --clear-browser-data REM Clear browser cookies and cache for Edge
start ddg --clear-cache --clear-cookies REM Clear browser cookies and cache for DuckDuckGo

REM Disk Encryption
manage-bde -on C:\ -RecoveryPassword REM Enable BitLocker encryption for drive C:\

REM Browser Encryption
"C:\Program Files\Mozilla Firefox\firefox.exe" -CreateProfile "encrypted-profile" REM Create encrypted Firefox profile
encfs "C:\Users\.\AppData\Roaming\Mozilla\Firefox\Profiles\encrypted-profile" "C:\Users\.\AppData\Roaming\Mozilla\Firefox\Profiles\plain-profile" REM Mount encrypted Firefox profile
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --user-data-dir="C:\Users\.\AppData\Local\Google\Chrome\encrypted-profile" REM Create encrypted Chrome profile
encfs "C:\Users\.\AppData\Local\Google\Chrome\encrypted-profile" "C:\Users\.\AppData\Local\Google\Chrome\plain-profile" REM Mount encrypted Chrome profile
"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" --user-data-dir="C:\Users\.\AppData\Local\BraveSoftware\Brave-Browser\encrypted-profile" REM Create encrypted Brave profile
encfs "C:\Users\.\AppData\Local\BraveSoftware\Brave-Browser\encrypted-profile" "C:\Users\.\AppData\Local\BraveSoftware\Brave-Browser\plain-profile" REM Mount encrypted Brave profile
"C:\Program Files\Vivaldi\Application\vivaldi.exe" --user-data-dir="C:\Users\.\AppData\Local\Vivaldi\encrypted-profile" REM Create encrypted Vivaldi profile
encfs "C:\Users\.\AppData\Local\Vivaldi\encrypted-profile" "C:\Users\.\AppData\Local\Vivaldi\plain-profile" REM Mount encrypted Vivaldi profile
"C:\Program Files\DuckDuckGo\ddg.exe" --user-data-dir="C:\Users\.\AppData\Local\DuckDuckGo\encrypted-profile" REM Create encrypted DuckDuckGo profile
encfs "C:\Users\.\AppData\Local\DuckDuckGo\encrypted-profile" "C:\Users\.\AppData\Local\DuckDuckGo\plain-profile" REM Mount encrypted DuckDuckGo profile

REM Secunetcon. Copyright © 2024. Joseph D. Smith. Licensed under Apache 2.0