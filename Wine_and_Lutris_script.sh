#!/bin/bash
#Author:	Daggenthal
#Started:	3/20/2020 at 22:34	
#Finished:	3/21/2020 at 02:09
#Edited:	12/23/2020 at 19:51 (Added support for Ubuntu Groovy for Wine installation.)

{
openSuse=$(awk "NR==4" /etc/os-release)
ubuntu=$(lsb_release -c)							# Gets the codename for the distribution, and stores it into a variable called codename. This only works on Debian based distros.
fedora=$(cat /etc/fedora-release)					# This does the same thing as codename, but for Fedora.
arch=$(awk "NR==3" /etc/os-release)							# I lied. Apparently Manjaro has this included as well.
linuxMint=$(awk "NR==11" /etc/os-release)			# I kept getting an error with lsb_release -c, being this: line XX: [: missing `]'. I couldn't fully figure it out, even though it's telling me DIRECTLY what it's missing, so instead I just created a workaround, which is too vague but it still works for now.
printf "%s\n" "$ubuntu"							# Prints out which codename it grabbed. Entirely useless, only for debugging.
printf "%s\n" "$fedora"								# This does the same thing, but for Fedora 30 / 31; Also useless, only for debugging.
} &> /dev/null 										# This hides the nasty "command not found..." errors for this block of code.

{
printf "Now installing Wine and Lutris.\n"
printf "Thank you for downloading my script. If you have any issues, please let me know on the forums.\n\n"
printf "This may take up to a minute or two, depending on your Internet speed, to complete...\n"
}

{
if [ "$ubuntu" == "Codename:	eoan" ];            # Lines 14, 18, 22, 26, 30, 33, and 36 just check what was printed out by the variables and continue execution. (Expanded on below)
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$ubuntu" == "Codename:	focal" ];       #Ubuntu 20.04 LTS and Linux Mint 20.04
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$linuxMint" == "VERSION_CODENAME=ulyana" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$ubuntu" == "Codename:	bionic" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$ubuntu" == "Codename:	tricia" ] || [ "$codename" == "Codename:	tina" ] || [ "$codename" == "Codename:	tessa" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y && sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport -y && sudo apt-get update && wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key | sudo apt-key add -    && echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04 ./" | sudo tee /etc/apt/sources.list.d/wine-obs.list && sudo apt update && sudo apt install --install-recommends winehq-stable -y
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$ubuntu" == "Codename:	xenial" ] || [ "$codename" == "Codename:	sarah" ] || [ "$codename" == "Codename:	serena" ] || [ "$codename" == "Codename:	sonya" ] || [ "$codename" == "Codename:	sylvia" ];
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
	sudo add-apt-repository ppa:lutris-team/lutris -y && sudo apt-get update && sudo apt-get install lutris -y
elif [ "$ubuntu" == "Codename:	groovy" ]
then
	sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' -y && sudo apt update && sudo apt install --install-recommends winehq-stable -y && sudo apt update
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
elif [ "$arch" == "ID_LIKE=arch" ];
then
	sudo pacman -S wine lutris -y
elif [ "$openSuse" == "ID_LIKE=opensuse suse" ];
then
	sudo zypper install -y wine lutris
fi	# This just ends the if, else if (elif), and "then" checks. If you want to add more checks, add it before "fi". Spacing matters. Tabs were used for this.
}

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
