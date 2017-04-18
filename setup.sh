# Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install ROS packages
sudo apt-get install -y python-rosinstall ros-kinetic-gazebo8-ros-pkgs ros-kinetic-gazebo8-ros-control ros-kinetic-ros-control ros-kinetic-ros-controllers

# Install Gazebo
curl -ssL http://get.gazebosim.org | sh

# Setup the workspace
cd ~/
source /opt/ros/kinetic/setup.bash
mkdir -p sac/src
cd sac/src
catkin_init_workspace
cd ..
catkin_make
source devel/setup.bash

# Get the projects for the workspace
cd src
git clone https://github.com/greenpro/sac_controllers.git
git clone https://github.com/greenpro/sac_description.git
git clone https://github.com/greenpro/sac_drivers.git
git clone https://github.com/greenpro/sac_gazebo.git
git clone https://github.com/greenpro/sac_launch.git
git clone https://github.com/greenpro/sac_translators.git
git clone https://github.com/greenpro/sac_msgs.git
#git clone https://github.com/greenpro/sac_config.git
#git clone https://github.com/greenpro/scorbot_config.git
#git clone https://github.com/greenpro/andreas_arm_config.git
cd ..
catkin_make
echo "source ~/sac/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Move the utility scripts to the workspace
cp ~/sac_setup/gitPull.sh gitPull.sh
cp ~/sac_setup/gitPush.sh gitPush.sh
cp ~/sac_setup/build.sh build.sh

# Build the project
./build.sh
