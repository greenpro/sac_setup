# Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install Gazebo
wget http://osrf-distributions.s3.amazonaws.com/gazebo/gazebo8_install.sh
sh gazebo8_install.sh
#curl -ssL http://get.gazebosim.org | sh

# Install ROS packages
sudo apt-get install python-rosinstall 
sudo apt-get install ros-kinetic-gazebo8-ros-pkgs 
sudo apt-get install ros-kinetic-gazebo8-ros-control 
sudo apt-get install ros-kinetic-ros-control 
sudo apt-get install ros-kinetic-ros-controllers 
sudo apt-get install ros-kinetic-gazebo-ros
#sudo apt-get install -y ros-kinetic-moveit

# Setup the workspace
source /opt/ros/kinetic/setup.bash
mkdir -p ~/sac/src
cd ~/sac/src
catkin_init_workspace
cd ~/sac
catkin_make
. devel/setup.bash

# Get the projects for the workspace
cd ~/sac/src
wget www.craigcode1010.com/sac/kinetic/sac_controllers-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_description-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_drivers-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_gazebo-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_launch-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_translators-kinetic.tar.gz
wget www.craigcode1010.com/sac/kinetic/sac_msgs-kinetic.tar.gz

tar -xzf sac_controllers-kinetic.tar.gz
tar -xzf sac_description-kinetic.tar.gz
tar -xzf sac_drivers-kinetic.tar.gz
tar -xzf sac_gazebo-kinetic.tar.gz
tar -xzf sac_launch-kinetic.tar.gz
tar -xzf sac_translators-kinetic.tar.gz
tar -xzf sac_msgs-kinetic.tar.gz

rm sac_controllers-kinetic.tar.gz
rm sac_description-kinetic.tar.gz
rm sac_drivers-kinetic.tar.gz
rm sac_gazebo-kinetic.tar.gz
rm sac_launch-kinetic.tar.gz
rm sac_translators-kinetic.tar.gz
rm sac_msgs-kinetic.tar.gz

# Source the project
echo "source ~/sac/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Get the gripper fix project
#mkdir -p ~/sac_setup/jennifer/src
#cd ~/sac_setup/jennifer/src
#catkin_init_workspace
#cd ~/sac_setup/jennifer/
#catkin_make
#source devel/setup.bash
git clone https://github.com/jenniferBuehler/gazebo-pkgs.git
#cp -a ~/sac_setup/jennifer/gazebo-pkgs/gazebo_grasp_fix ~/sac_setup/jennifer/src/
cd ~/sac_setup/
cp -a ~/sac_setup/gazebo-pkgs/gazebo_grasp_plugin ~/sac/src/
rm -rf gazebo-pkgs
#cd ~/sac_setup/jennifer
#catkin_make
#catkin_make install
#cd ~/sac_setup
#rm -rf jennifer
cd ~/sac/
catkin_make

# Move the world objects into the gazebo world folder
cp -a ~/sac_setup/objects/* ~/.gazebo/meshes/

# Move the utility scripts to the workspace
cp ~/sac_setup/workspaceScripts/* ~/sac/

# Make the workspace
cd ~/sac
. devel/setup.bash
./build.sh

# Build the project
./build.sh
