.PHONY: update cuda_install network_tools

update:
	sudo apt update && sudo apt upgrade -y

cuda_install:
	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
	sudo dpkg -i cuda-keyring_1.1-1_all.deb
	sudo apt-get update
	sudo apt-get -y install cuda-toolkit-12-5
network_tools:
	sudo apt install bind9-dnsutils