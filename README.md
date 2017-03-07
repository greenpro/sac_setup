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

rpiSetup.sh
* Run this script to setup the programs, workspace, and projects for the Southern Arm Control project on Raspian.

## General SAC project notes
* When generating messages and services create the service, build it, and make sure the *.h files have been generated before #including the files in any source files. This is because the service headers are generated last in the cmake process.
* When running the gitPush.sh on "Bash on Ubuntu on Windows" "cache" in the first line might need to be changed to "no-cache".
