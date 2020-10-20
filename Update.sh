#!/bin/bash

					                # This is the start of my auto-update script that works on every OS that's implemented.

{
debian=$(awk "NR==4" /etc/os-release)		    # Gets the codename for the distribution, and stores it into a variable called codename.
fedora=$(awk "NR==3" /etc/os-release)
arch=$(awk "NR==3" /etc/os-release)
openSuse=$(awk "NR==4" /etc/os-release)
linuxMint=$(awk "NR==11" /etc/os-release)
} &> /dev/null				        # This hides the nasty "command not found..." errors for this block of code.

#{
#printf "%s\n" "$arch"		    # Prints out which codename it grabbed. Entirely useless, only for debugging.
#printf "%s\n" "$debian"
#printf "%s\n" "$fedora"
#} 2>&1 #&> /dev/null 			    # 2>&1 redirects stderr into stdout, therefore hiding the "This command doesn't exist" error.

{
if [ "$debian" == "ID_LIKE=debian" ];
then
	sudo apt update -y && sudo apt upgrade -y --allow-downgrades && sudo apt autoremove -y
elif [ "$fedora" == "ID=fedora" ];
then
	sudo dnf update -y && sudo dnf upgrade -y
elif [ "$arch" == "ID_LIKE=arch" ];
then
	sudo pacman -Syu -y
elif [ "$openSuse" == "ID_LIKE=opensuse suse" ];
then
	sudo zypper refresh && sudo zypper update -y
fi					                # This just ends the if, else if (elif), and "then" checks.
}
