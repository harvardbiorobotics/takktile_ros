FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/takktile_ros/msg"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/takktile_ros/Info.h"
  "../msg_gen/cpp/include/takktile_ros/Raw.h"
  "../msg_gen/cpp/include/takktile_ros/Contact.h"
  "../msg_gen/cpp/include/takktile_ros/Touch.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
