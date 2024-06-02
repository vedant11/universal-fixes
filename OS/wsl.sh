# WSL virtual hard disks (VHDs) grow in size as you use them, and now with this feature enabled they will automatically shrink in size too
# https://github.com/MicrosoftDocs/WSL/issues/1855
wsl --manage <distro> --set-sparse true

# export distro
wsl.exe --export myubuntu myubuntu_backup.tar && wsl.exe --unregister myubuntu
# mount distro
wsl.exe --import myubuntu2 <destination> <path>myubuntu_backup.tar

# default user for wsl
wsl.exe config --default-user <username>

# force reclaim storage
wsl --manage <distro> --set-sparse false
optimize-vhd -Path pathto\ext4.vhdx -Mode full
# for windows home edition: 
: '
diskpart
select vdisk file="C:\WSL-Distros\…\ext4.vhdx"
attach vdisk readonly
compact vdisk
detach vdisk
exit
'
wsl --manage <distro> --set-sparse true # to turn on auto-reclaiming of storage

# get path of external virtualized disk
(Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq 'Ubuntu-22.04' }).GetValue("BasePath") + "\ext4.vhdx"
