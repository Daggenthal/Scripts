#!/bin/bash
#Author:	ColdZero (Global for Homecoming: @Naudilus)
#Started:	3/20/2020 at 22:34	
#Finished:	3/21/2020 at 02:09
#Edited:	8/13/2020 at 02:28 (Changed the variable "codename" to "debian", as I was using it for Ubuntu, but it works the same as it's Debian based.)

{
debian=$(lsb_release -c)							# Gets the codename for the distribution, and stores it into a variable called codename. This only works on Debian based distros.
fedora=$(cat /etc/fedora-release)					# This does the same thing as codename, but for Fedora.
manjaro=$(lsb_release -d)							# I lied. Apparently Manjaro has this included as well.
linuxMint=$(awk "NR==11" /etc/os-release)			# Workaround for lsb_release -c for Linux Mint 20.04 for when it was originally released. On release, it would throw errors, but after a week they had fixed said errors. This is an outdated method to obtain the name, but still works. 

printf "%s\n" "$debian"							# Prints out which codename it grabbed. Entirely useless, only for debugging.
printf "%s\n" "$fedora"								# This does the same thing, but for Fedora 30 / 31; Also useless, only for debugging.
} &> /dev/null 										# This hides the nasty "command not found..." errors for this block of code.

{
printf "Now installing Wine and Lutris.\n"
printf "Thank you for downloading my script. If you have any issues, please let me know on the forums.\n\n"
printf "This may take up to a minute or two, depending on your Internet speed, to complete...\n"
}

{
if [ "$debian" == "Codename:	eoan" ];            # Lines 23, 27, 31, 35, 39, 43, 47, 50, 53, and 56 just check what was printed out by the variables and continue execution. (Expanded on below)
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$debian" == "Codename:	focal" ];       # Ubuntu 20.04 LTS and Linux Mint 20.04
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$linuxMint" == "VERSION_CODENAME=ulyana" ];	# Out of date way to obtain the codename. While this still works, lsb_release -c now works on Linux Mint 20.04 after they updated it.
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$debian" == "Codename:	bionic" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$debian" == "Codename:	tricia" ] || [ "$codename" == "Codename:	tina" ] || [ "$codename" == "Codename:	tessa" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y && sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport -y && sudo apt-get update && wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key | sudo apt-key add -    && echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04 ./" | sudo tee /etc/apt/sources.list.d/wine-obs.list && sudo apt update && sudo apt install --install-recommends winehq-stable -y
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$debian" == "Codename:	xenial" ] || [ "$codename" == "Codename:	sarah" ] || [ "$codename" == "Codename:	serena" ] || [ "$codename" == "Codename:	sonya" ] || [ "$codename" == "Codename:	sylvia" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$fedora" == "Fedora release 32 (Thirty Two)" ]
then
	sudo rpm --import https://dl.winehq.org/wine-builds/winehq.key && sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo -y && sudo dnf install winehq-staging -y && sudo dnf install lutris -y
elif [ "$fedora" == "Fedora release 31 (Thirty One)" ]
then
	sudo rpm --import https://dl.winehq.org/wine-builds/winehq.key && sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/31/winehq.repo -y && sudo dnf install winehq-stable -y && sudo dnf install lutris -y
elif [ "$fedora" == "Fedora release 30 (Thirty)" ]
then
	sudo rpm --import https://dl.winehq.org/wine-builds/winehq.key && sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/30/winehq.repo -y && sudo dnf install winehq-stable -y && sudo dnf install lutris -y
elif [ "$manjaro" == "Description:	Manjaro Linux" ]
then
	sudo pacman -S wine lutris -y
fi	# This just ends the if, else if (elif), and "then" checks. If you want to add more checks, add it before "fi". Spacing matters. Tabs were used for this.
}

##{
#clear
#}

{
printf "The installation is now complete.\n\n" # These are all self explanatory. They just print out a message to the terminal.
printf "If you are using Ubuntu 16.04 or Linux Mint 18.x, please ignore the GLib message if it shows up.\n\n"
printf "This script was created by ColdZero on the Homecoming Forums.\n\n"
printf "If you have an iGPU (integrated graphics, specifically Intel), and your desktop crashes while using Ubuntu 20.04 or any variant (i.e. Pop_OS 20.04), turn off your iGPU in the BIOS. I was having the same issues, and this improved both my FPS and solved my issues of crashing to where I had to login again.\n"
printf "Now showing the current verions of Wine and Lutris installed.\n\n"
}

{
wine --version && lutris --version # This just runs (and prints out) the versions of Wine and Lutris that were installed.
}

{
read -p "Would you like to go to the forums? (Y/N) " answer # This entire block of code reads the user input, and performs an action upon their response. This line reads what key is pressed.
while true
do
  case $answer in # This is just a case for yes and no.
   [yY]* ) xdg-open https://forums.homecomingservers.com/topic/14830-how-to-get-city-of-heroes-running-on-linux/ # xdg-open opens a file, or in this case, a website, based upon the users input.
           echo "Have a lovely day / night!" # Self explanitory. This just "echos" a string to the terminal.
           break;; # This breaks the [yY] section, and goes to the [nN] section if the user inputted n / N.

   [nN]* ) 
           echo "Have a lovely day / night!"
           exit;;
   * )     
  esac # This is just the word case, but reversed. This ends the case-switch.
done 
}


# 											This is just more in-depth information as to what it does.


# If you are reading this, hello! If you have any issues with this script that I made, or you if want to leave some feedback, please post it on the forum!
# I created this script because I realized that those whom are new to Linux, may feel uncomfortable, or have no clue which version they're on.
# This is my first ACTUAL "program". I say "program" because it's just an install script that just chooses which commands to run by figuring out your codename on lines 7-9.
# Lines 11 and 12 just print out the codename, which I should honestly remove. It's more of a "debug" thing than anything else.
# Lines 14, 18, 22, 26, 30, 33, and 36 just figure out which codename your distribution is using, by taking what was printed out and stored into variables $codename, $fedora, $manjaro, and comparing it to what SHOULD be printed out.
# This script works on Ubuntu 16.04, 18.04, and 19.10; It also works on Linux Mint 18.x, 19.x, and 20.x. I've also tested this on Pop!_OS 19.10, which all of these are just based off of Ubuntu (besides Ubuntu, obviously), and that's based off of Debian.
# This script now works on Fedora 30 / 31 thanks to a suggestion from the user DoctorDitko on the forums to add in support.
# I've added support for Manjaro as well. As long as your system is up to date with 'sudo pacman -Syu', this script should function properly.

# Forum URL: https://forums.homecomingservers.com/topic/14830-how-to-get-city-of-heroes-running-on-linux/

