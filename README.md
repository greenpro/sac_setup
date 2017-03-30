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

## Terms
These terms will apply to this and all other projects mention in the "Projects" section below.

### SAC and sac
    This is an abreviation for Southern Arm Control.

### Workspace
    For this and all other Southern Arm Control projects, the term workspace will refer to all of the SAC projects as they exist in a sigle ROS workspace.

### Project
    This refers to an individual project within the SAC workspace or the sac_setup project. These are all noted in the "Projects" section below.

### RPi
    This is an abreviation used for the Raspberry Pi.

## General Design Guidelines
1. The projects in the SAC workspace should be as disjoint as possible (they should not depend on another project to build), with exception to the sac_launch, which depends on everything, and the sac_msgs, which everything depends on, these projects were created to make the others more independant of eachother.
2. In keeping with the ROS methodology each node should do one task and nothing else, if another task is needed another node should be used for it.
3. The README.md files in each folder should contain all the information for that folder needed by a developer.
4. This workspace is ment to be used in overall robotics control education. In keeping with this the installation and use of the workspace should require as little knowlege of ROS and the nuts and bolts of the framework and system as possible to allow for a maximum amount of time spent working on algorithms and concepts.
5. This workspace should include only currently develped ROS components. This will allow the project to keep current with new releases of ROS on current versions of Ubuntu and Raspian.
6. Any code or examples of code used should be noted in the README.md in the description for the file the code was used in.
7. All README.md files should follow the same format as shown in the README_mainTemplate.md and README_subFolderTemplate.md. Each section of the template should be included only if it is applicable to the project or folder. This is to make the project more uniform and to simplify documentation.

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

## Projects
### sac_setup
    This is not a ros project, but a project to setup ros and all of its components, along with the Southern Arm Control project. Start here to use the SAC system.

### sac_controllers
    This project contains all of the overall controllers for the project to perform top level actions with the arm.

### sac_translators
    This project contains translator nodes to translate from the global inputs of the controllers to the joint space inputs of the motors.

### sac_drivers
    This project contains the nodes to communicate with the hardware and low level components of the robot.

### sac_gazebo
    This project contains all of the components for using and running gazebo.

### sac_description
    This project contains the descriptions for the robots used.

### sac_msgs
    This project contains the custom message, service, and action files used in the rest of the project all other projects will depend on this project.

### sac_launch
    This project contains all of the global launch files used to launch files from the other nodes.

### sac_config (not in use)
    This project was generated by teh MoveIt! Setup Assistant for the Scorbot and Andreas arms.

### scorbot_config (not in use)
    This project was generated by the MoveIt! Setup Assistant for the Scorbot arm.

### andreas_arm_config (not in use)
    This project was generated by the MoveIt! Setup Assistant for the Andreas arm.

## General SAC project notes
* When generating messages and services create the service, build it, and make sure the *.h files have been generated before #including the files in any source files. This is because the service headers are generated last in the cmake process. This can be done by adding the project the message is in to the dependancies.
* When running the gitPush.sh on "Bash on Ubuntu on Windows" "cache" in the first line might need to be changed to "no-cache".
