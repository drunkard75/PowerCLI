# Used to change a newly created VM from DHCP to static IP

Add-PSSnapin VMware.VIMAutomation.Core

$vCenter = Read-Host "Enter vCenter Name or IP"
$VM = Read-Host "Enter VM Name"
$AdminUser = Read-Host "Enter local admin username"
$AdminPass = Read-Host "Enter local admin password"
$IP = Read-Host "Enter IP Address"
$Netmask = Read-Host "Enter Netmask (e.g. 255.255.255.0)"
$Gateway = Read-Host "Enter gateway (e.g. 192.168.1.100)"
$DNS = Read-Host "Enter DNS Server"
Connect-VIServer $vCenter

Get-VMGuestNetworkInterface -VM $VM -GuestUser $AdminUser -GuestPassword $AdminPass | Where-Object { $_.ip -ne $null} | Set-vmguestnetworkinterface -ip $IP -netmask $Netmask -gateway $Gateway -Dns $DNS -GuestUser $AdminUser -GuestPassword $AdminPass

Disconnect-VIServer -Confirm:$false

Remove-Variable vCenter
Remove-Variable VM
Remove-Variable AdminUser
Remove-Variable AdminPass
Remove-Variable IP
Remove-Variable Netmask
Remove-Variable Gateway
Remove-Variable DNS
