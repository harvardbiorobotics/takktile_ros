FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/takktile/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/takktile/msg/__init__.py"
  "../src/takktile/msg/_Touch.py"
  "../src/takktile/msg/_Info.py"
  "../src/takktile/msg/_Contact.py"
  "../src/takktile/msg/_Raw.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
