
(cl:in-package :asdf)

(defsystem "takktile-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Touch" :depends-on ("_package_Touch"))
    (:file "_package_Touch" :depends-on ("_package"))
    (:file "Info" :depends-on ("_package_Info"))
    (:file "_package_Info" :depends-on ("_package"))
    (:file "Contact" :depends-on ("_package_Contact"))
    (:file "_package_Contact" :depends-on ("_package"))
    (:file "Raw" :depends-on ("_package_Raw"))
    (:file "_package_Raw" :depends-on ("_package"))
  ))