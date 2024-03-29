# WSL virtual hard disks (VHDs) grow in size as you use them, and now with this feature enabled they will automatically shrink in size too
# https://github.com/MicrosoftDocs/WSL/issues/1855
wsl --manage <distro> --set-sparse true

# export distro
wsl.exe --export myubuntu myubuntu_backup.tar && wsl.exe --unregister myubuntu
# mount distro
wsl.exe --import myubuntu2 <destination> <path>myubuntu_backup.tar

# default user for wsl
wsl.exe config --default-user <username>