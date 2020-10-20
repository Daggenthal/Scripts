#! /bin/bash

printf "Please input the software you'd like to install: "

read install

{
debian=$(awk "NR==4" /etc/os-release)		    # Gets the codename for the distribution, and stores it into a variable called codename.
fedora=$(awk "NR==3" /etc/os-release)
arch=$(awk "NR==3" /etc/os-release)
openSuse=$(awk "NR==4" /etc/os-release)
linuxMint=$(awk "NR==11" /etc/os-release)
} &> /dev/null				        # This hides the nasty "command not found..." errors for this block of code.

{
if [ "$debian" == "ID_LIKE=debian" ];
then
	sudo apt-get install -y $install
elif [ "$fedora" == "ID=fedora" ];
then
	sudo dnf install -y $install
elif [ "$arch" == "ID_LIKE=arch" ];
then
	sudo pacman -S --noconfirm $install
elif [ "$openSuse" == "ID_LIKE=opensuse suse" ];
then
	sudo zypper install -y $install
fi					                # This just ends the if, else if (elif), and "then" checks.
}
