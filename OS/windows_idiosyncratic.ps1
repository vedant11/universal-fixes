# windows setup

# disable wigets-pack
# in terminal with administrator priviledges
winget uninstall "windows web experience pack" 


# setup Linux VM
wsl --import <vmname> <installation_path> <backup_path>


# allow execution by signed in remote users
Set-ExecutionPolicy RemoteSigned
