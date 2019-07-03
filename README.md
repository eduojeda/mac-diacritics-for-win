# MacOS-like diacritical mark input for Windows
This is an AutoHotKey script that emulates the MacOS diacritical mark input mechanism under Windows.

As a developer, I find the US keyboard layout superior for coding. As a spanish speaker, I need to be able to easily add diacritical marks to characters when typing, but the US keyboard layout does not include any of the the necessary keys. Changing keyboard layouts constantly is impractical, and memorizing AltGr codes is clunky and doesn't work without a numeric keypad. Unfortunately, Windows does not offer any native solutions. MacOS has historically solved this problem nicely by allowing the use of Alt+Character combos to "prime" a diacritical mark for the next keystroke. For example, pressing Alt+E will prime a tilde, so that the next typed character will carry one.

This script attempts to replicate this functionality for some of the possible diacritical marks. Adding other ones should be fairly easy, as the mechanism used is generic. It also emulates some basic media key functionality , because this script is meant for personal use and I find it convenient to keep all keyboard emulation in one place :)

## How to use
1. Download and install AutoHotKey for Windows from https://www.autohotkey.com/
2. Once AHK is installed, double-clicking the script should launch it. The script will run in the background and can be controlled from the tray.
3. It's convenient to have the script automatically launch at startup. This can be done by using Win+R to run the "shell:startup" command, and then adding a shortcut to the script to the directory that opens.

## Supported keys
Alt+E -> acute (á, Á)
Alt+I -> circumflex (â, Â)
Alt+N -> tilde (ñ, Ñ)
Alt+U -> umlaut (ü, Ü)

Alt+Ctrl+Down  -> Media pause
Alt+Ctrl+Right -> Media next
Alt+Ctrl+Left  -> Media previous

## Credits
This script is really just a simplified version of a script found on this blogpost by Aaron Gustafson:
https://www.aaron-gustafson.com/notebook/mac-like-special-characters-in-windows/

He based his code in turn on a post by Veil on the AHK user forums.
