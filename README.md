# Pac-Man
## To run the game, follow the instructions below:

# Contents
 - [Windows Users](#windows-users)
 - [Mac Users](#mac-users)

# **Windows Users:**

# 1.  Follow instructions [here](https://cs3110.github.io/textbook/chapters/preface/install.html) to install OCaml on the Windows Subsystem for Linux (WSL).

# 2.  Download [VcXsrv](https://sourceforge.net/projects/vcxsrv/) and install

# 3.  Open the newly installed "XLaunch" application with the following options:
        Multiple Windows
        Display number: 0
            Click Next
        Start no client
            Click Next
        Extra Settings: check all (make sure most importantly, disable access control)
            Click Next
        Finish

# 4.  Make WSL ready to run graphical interface by following the instructions below in the Ubuntu terminal:
        1. cd ~
        2. nano .bashrc
        3. after the 'esac' on line 10 or 11, add the following two lines of 'export' commands:

            export DISPLAY="$(ipconfig.exe | grep 'Wi-Fi' -A4 | cut -d':' -f 2 | tail -n1 | sed -e 's/\s*//g'):0.0"
            export LIBGL_ALWAYS_INDIRECT=1

            ------------------------------------------
            Example:

            # some comment
            case $- in
            ...
            esac

            export DISPLAY="$(ipconfig.exe | grep 'Wi-Fi' -A4 | cut -d':' -f 2 | tail -n1 | sed -e 's/\s*//g'):0.0"
            export LIBGL_ALWAYS_INDIRECT=1

            # some comment for the next code block

        4. Now exit with Ctrl+X
        5. Press "y" to save
        6. Press enter (IMPORTANT: file name should be ".bashrc")

# 5.  Restart Ubuntu terminal and run these commands to install all dependencies:
## You will enter the 'root' user to be able to install the packages below.
        1. sudo -s
        2. sudo apt install aptitude
        3. aptitude install ocaml-tools libsdl-ocaml-dev -o APT::GET::Fix-Missing=true

# 6.  Restart Ubuntu terminal again (so that user is default again)
        1. cd (final project folder)
        2. opam update
        3. opam upgrade
        4. make init

# 7. Play Game:
        1. make build
        2. make game
                Use W, A, S, D to "move" up, left, down, and right
                Use Esc to exit game.

# <hr>

# **Mac Users:**
## The following directions to install the Virtual Machine are summarized from the [reference webpage](https://cs3110.github.io/textbook/chapters/appendix/vm.html). Please take a look at the web page for more detailed instructions.

# 1.  Download [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and install it.

# 2.  Download the [CS 3110 Ubuntu Virtual Machine](https://cornell.box.com/v/cs3110-2021fa-ubuntu)

# 3.  Launch VirtualBox, select File → Import Appliance, and choose the .ova file you just downloaded. Click Next, then Import.

# 4.  Select "cs3110-2021fa-ubuntu", and click "start".
## If any errors occur, please see the [reference webpage](https://cs3110.github.io/textbook/chapters/appendix/vm.html) for detailed help.

# 5.  Username and password are both "camel".

# 6.  Now, install OCaml using the directions from [this webpage](https://cs3110.github.io/textbook/chapters/appendix/vm.htm), following instructions for "Linux".

# 7.  Check whether X11 is installed by running "run dpkg -l | grep xorg". If not, download and install [XQuartz](https://www.xquartz.org/index.html) to be able to run a graphical window from Linux.

# 8.  Restart Ubuntu terminal and run these commands to install all dependencies:
## You will enter the 'root' user to be able to install the packages below.
        1. sudo -s
        2. sudo apt install aptitude
        3. aptitude install ocaml-tools libsdl-ocaml-dev -o APT::GET::Fix-Missing=true

# 9.  Restart Ubuntu terminal again (so that user is default again)
        1. cd (final project folder)
        2. opam update
        3. opam upgrade
        4. make init

# 10. Play Game:
        1. make build
        2. make game
                Use W, A, S, D to "move" up, left, down, and right
                Use Esc to exit game.
