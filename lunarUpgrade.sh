# Update ROS
sudo apt-get remove ros-kinetic-desktop-full -y
sudo apt autoremove -y
sudo apt-get install ros-lunar-desktop-full -y

# Update ROS packages
sudo apt-get remove -y ros-kinetic-gazebo8-ros-pkgs ros-kinetic-gazebo8-ros-control ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-gazebo-ros

sudo apt-get install -y ros-lunar-gazebo8-ros-pkgs ros-lunar-gazebo8-ros-control ros-lunar-ros-control ros-lunar-ros-controllers ros-lunar-gazebo-ros

# Get the projects for the workspace
cd ~/sac
./gitPull.sh

# Move the utility scripts to the workspace
cp ~/sac_setup/workspaceScripts/* ~/sac/

# Make the workspace
cd ~/sac
. devel/setup.bash
./build.sh
