FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/takktile_ros/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/takktile_ros/msg/__init__.py"
  "../src/takktile_ros/msg/_Info.py"
  "../src/takktile_ros/msg/_Raw.py"
  "../src/takktile_ros/msg/_Contact.py"
  "../src/takktile_ros/msg/_Touch.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
