#!/bin/bash

					                # This is the start of my auto-update script that works on every OS that's implemented.

{
codename=$(lsb_release -c)		    # Gets the codename for the distribution, and stores it into a variable called codename.
fedora=$(cat /etc/fedora-release)
manjaro=$(lsb_release -d)
linuxMint=$(awk "NR==11" /etc/os-release)
} &> /dev/null				        # This hides the nasty "command not found..." errors for this block of code.

{
printf "%s\n" "$manjaro"		    # Prints out which codename it grabbed. Entirely useless, only for debugging.
printf "%s\n" "$codename"
printf "%s\n" "$fedora"
} 2>&1 #&> /dev/null 			    # 2>&1 redirects stderr into stdout, therefore hiding the "This command doesn't exist" error.

{
if [ "$codename" == "Codename:	focal" ] || [ "$codename" == "Codename:	disco" ] || [ "$codename" == "Codename:	eoan" ] || [ "$linuxMint" == "VERSION_CODENAME=ulyana" ] ||  [ "$codename" == "Codename:	tricia" ];
then
	sudo apt update -y && sudo apt upgrade -y --allow-downgrades && sudo apt autoremove -y
elif [ "$fedora" == "Fedora release 32 (Thirty Two)" ] || [ "$fedora" == "Fedora release 31 (Thirty One)" ] || [ "Fedora release 30 (Thirty) " ];
then
	sudo dnf update -y && sudo dnf upgrade -y
elif [ "$manjaro" == "Description:	Manjaro Linux" ];
then
	sudo pacman -Syu -y
fi					                # This just ends the if, else if (elif), and "then" checks.
}
