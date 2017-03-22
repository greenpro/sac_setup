# Southern Arm Control Setup

This project contains files for the setup of the Southern Arm Control project and for the setup of the Ubutu and Raspian environments for the use of ROS.

## Files

gitPush.sh
* To push all of the projects in the workspace run this script (the comment entered will be used for all of the projects).
* This file will be moved to the sac workspace folder during project setup.

gitPull.sh
* To pull all of the projects in the workspace run this script.
* This file will be moved to the sac workspace folder during project setup.

setupPush.sh
* To push the setup project use run this script.
* The script will also copy the gitPush.sh and gitPull.sh files to the sac workspace.

setupPull.sh
* To pull the setup project use run this script.
* The script will also copy the gitPush.sh and gitPull.sh files to the sac workspace.

setup.sh
* Run this script to setup the programs, workspace, and projects for the Southern Arm Control project on Ubuntu.
* Much of the code for this script comes from http://wiki.ros.org/kinetic/Installation/Ubuntu.

rpiSetup.sh
* Run this script to setup the programs, workspace, and projects for the Southern Arm Control project on Raspian.
* Much of the code for this script comes from http://wiki.ros.org/ROSberryPi/Installing%20ROS%20Indigo%20on%20Raspberry%20Pi.
* The note at the top of the page that you can use the regular ros setup for the RPi 3 is wrong it does not work currently.

## Installation
### Raspberry Pi
1. Obtain a Raspberry Pi (RPi) 3 (the project should also work on an RPi 2).
2. Obtain an 8Gb class 10 micro SD card for the pi (lower class levels will work but will be much slower)
3. Install either Raspian Jessie with Pixel or Raspian Jessie Lite on the SD card using win32DiskImager if on windows.
4. Setup Raspian as you like on the RPi installing any programs you would like to have (run "sudo raspi-config" to setup any RPi features of the pi itself, don't forget to change the keyboard layout to English (US), you will need to reboot for this to take effect).
5. Install git.
6. Clone this project into the home directory of the RPi.
7. Run rpiSetup.sh, this will install ros, the sac project, a ROS workspace, and all other items for the project.
8. The sac_setup project can now be removed from the RPi if desired.
9. Follow the instructions in the sac project for running, modifying, and using the projects.

### Ubuntu 16.04
1. Install Ubuntu 16.04 on either a computer or a virtual machine.
2. Setup Ubuntu as you like installing any programs you would like to have.
3. Install git.
4. Clone this project into the home directory of Ubuntu
5. Run setup.sh, this will install ros, the sac project, a ROS workspace, and all other items for the project.
6. The sac_setup project can now be removed from Ubuntu if desired.
7. Follow the instructions in the sac project for running, modifying, and using the projects.

## General SAC project notes
* When generating messages and services create the service, build it, and make sure the *.h files have been generated before #including the files in any source files. This is because the service headers are generated last in the cmake process.
* When running the gitPush.sh on "Bash on Ubuntu on Windows" "cache" in the first line might need to be changed to "no-cache".
