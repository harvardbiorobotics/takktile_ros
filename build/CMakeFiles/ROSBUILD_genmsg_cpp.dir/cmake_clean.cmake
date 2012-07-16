FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/takktile/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/takktile/Touch.h"
  "../msg_gen/cpp/include/takktile/Info.h"
  "../msg_gen/cpp/include/takktile/Contact.h"
  "../msg_gen/cpp/include/takktile/Raw.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
