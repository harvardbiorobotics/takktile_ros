FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/takktile/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/Touch.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Touch.lisp"
  "../msg_gen/lisp/Info.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Info.lisp"
  "../msg_gen/lisp/Contact.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Contact.lisp"
  "../msg_gen/lisp/Raw.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Raw.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
