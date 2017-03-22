# Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu jessie main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-pip python-setuptools python-yaml python-distribute python-docutils python-dateutil python-six
sudo pip install rosdep rosinstall_generator wstool rosinstall
sudo rosdep init
rosdep update

mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --exclude roslisp --tar > kinetic-ros_comm-wet.rosinstall
wstool init src kinetic-ros_comm-wet.rosinstall

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install ROS packages
sudo apt-get install python-rosinstall

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
git clone https://github.com/greenpro/sac_config.git
git clone https://github.com/greenpro/sac_controllers.git
git clone https://github.com/greenpro/sac_description.git
git clone https://github.com/greenpro/sac_drivers.git
git clone https://github.com/greenpro/sac_gazebo.git
git clone https://github.com/greenpro/sac_launch.git
git clone https://github.com/greenpro/sac_translators.git
git clone https://github.com/greenpro/scorbot_config.git
git clone https://github.com/greenpro/andreas_arm_config.git
cd ..
catkin_make
echo "source ~/sac/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Move the utility scripts to the workspace
cp ~/sac_setup/gitPull.sh gitPull.sh
cp ~/sac_setup/gitPush.sh gitPush.sh
