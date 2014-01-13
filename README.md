takktile-ros
============

ros drivers for the TakkTile tactile array

1.) Install TakkTile TakkFast USB drivers (see https://github.com/TakkTile/TakkTile-usb)

This will install TakkTile.py which is a dependency (currently included as a symlink -- need to fix this)

2) Get code

> git clone --recursive https://github.com/harvardbiorobotics/takktile_ros.git

3) Add the package path to the ROS_PACKAGE_PATH

> export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/path/to/this/directory

or add it to the bashrc

> echo "ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:/path/to/this/directory" >> ~/.bashrc

> source ~/.bashrc

4) Compile

> rosmake takktile_ros

5) set USB permissions

> sudo cp 71-takktile.rules /etc/udev/rules.d/

6) Run
> rosrun takktile_ros takktile_node.py

7) Plot (in another terminal while takktile_node.py is running)

ROS Fuerte and earlier releases:
> rxplot /takktile/calibrated/pressure[0]:pressure[1]:pressure[2]:pressure[3]:pressure[4]

ROS Fuerte and later releases:
> rqt_plot /takktile/calibrated/pressure[0]:pressure[1]:pressure[2]:pressure[3]:pressure[4]
