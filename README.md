This is just a script that I've created in order to guide along users with installing both Wine, and Lutris.

It begins by detecting your current distribution, and, if it's hardcoded into it (supported), executes specific commands depending on which type of distro and version that you're using.

------------------------------------------------------------------------------------------------------------------------------------------------------------

Once you git-clone this, or, download it manually, we need to cd into the directory that it's located in; Typically, this is in the /home/$USER/Downloads/ folder.
When cloned and after we've CD'd into the proper directory, we need to give it permission to execute.
Once that's done, we execute the script.

1) cd ~/Downloads/
2) sudo chmod +x Wine_and_Lutris_script.sh
3) ./Wine_and_Lutris_script.sh

Once executed, it will grab your distro name as a string and compare it to existing ones in the code. If a match is found, code that matches it is executed. If no match is found, then the code simple just exits. Well, it just defaults it saying that it's finished, even though it didn't properly execute.



Last updated by Daggenthal at 01:34, 23/7/2020
