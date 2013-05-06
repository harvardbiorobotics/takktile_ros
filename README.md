takktile-ros
============

ros drivers for the TakkTile tactile array<br>
<br>
1.) Install TakkTile TakkFast USB drivers (see https://github.com/TakkTile/TakkTile-usb)<br>
This will install TakkTile.py which is a dependency (currently included as a symlink in takktile_ros -- need to fix this)<br>
2) Get code<br>
> git clne --recursive https://github.com/harvardbiorobotics/takktile_ros.git<br>
<br>
3) Add the package path to the ROS_PACKAGE_PATH<br>
> export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home<br>
<br>
Or add it to the bash<br>
> echo "ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:/home" >> ~/.bashrc<br>
> source ~/.bashrc<br>
<br>
4) Compile<br>
> rosmake takktile_ros<br>
<br>
5) set USB permissions<br>
> sudo cp 71-takktile.rules /etc/udev/rules.d/<br>
<br>
6) Run <br>
> rosrun takktile_ros takktile_node.py<br>
