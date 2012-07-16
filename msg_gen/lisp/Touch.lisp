; Auto-generated. Do not edit!


(cl:in-package takktile-msg)


;//! \htmlinclude Touch.msg.html

(cl:defclass <Touch> (roslisp-msg-protocol:ros-message)
  ((pressure
    :reader pressure
    :initarg :pressure
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Touch (<Touch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Touch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Touch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name takktile-msg:<Touch> is deprecated: use takktile-msg:Touch instead.")))

(cl:ensure-generic-function 'pressure-val :lambda-list '(m))
(cl:defmethod pressure-val ((m <Touch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile-msg:pressure-val is deprecated.  Use takktile-msg:pressure instead.")
  (pressure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Touch>) ostream)
  "Serializes a message object of type '<Touch>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pressure))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Touch>) istream)
  "Deserializes a message object of type '<Touch>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pressure) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pressure)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Touch>)))
  "Returns string type for a message object of type '<Touch>"
  "takktile/Touch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Touch)))
  "Returns string type for a message object of type 'Touch"
  "takktile/Touch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Touch>)))
  "Returns md5sum for a message object of type '<Touch>"
  "4a3d699886be367f8749f5edfbaab0ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Touch)))
  "Returns md5sum for a message object of type 'Touch"
  "4a3d699886be367f8749f5edfbaab0ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Touch>)))
  "Returns full string definition for message of type '<Touch>"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Touch)))
  "Returns full string definition for message of type 'Touch"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Touch>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pressure) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Touch>))
  "Converts a ROS message object to a list"
  (cl:list 'Touch
    (cl:cons ':pressure (pressure msg))
))
