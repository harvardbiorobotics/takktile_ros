; Auto-generated. Do not edit!


(cl:in-package takktile-msg)


;//! \htmlinclude Raw.msg.html

(cl:defclass <Raw> (roslisp-msg-protocol:ros-message)
  ((pressure
    :reader pressure
    :initarg :pressure
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (temp
    :reader temp
    :initarg :temp
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Raw (<Raw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Raw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Raw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name takktile-msg:<Raw> is deprecated: use takktile-msg:Raw instead.")))

(cl:ensure-generic-function 'pressure-val :lambda-list '(m))
(cl:defmethod pressure-val ((m <Raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile-msg:pressure-val is deprecated.  Use takktile-msg:pressure instead.")
  (pressure m))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <Raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader takktile-msg:temp-val is deprecated.  Use takktile-msg:temp instead.")
  (temp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Raw>) ostream)
  "Serializes a message object of type '<Raw>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Raw>) istream)
  "Deserializes a message object of type '<Raw>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'temp) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'temp)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Raw>)))
  "Returns string type for a message object of type '<Raw>"
  "takktile/Raw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Raw)))
  "Returns string type for a message object of type 'Raw"
  "takktile/Raw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Raw>)))
  "Returns md5sum for a message object of type '<Raw>"
  "b38c36fc45d3cf8e8951467b625f085b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Raw)))
  "Returns md5sum for a message object of type 'Raw"
  "b38c36fc45d3cf8e8951467b625f085b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Raw>)))
  "Returns full string definition for message of type '<Raw>"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] pressure~%float32[] temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Raw)))
  "Returns full string definition for message of type 'Raw"
  (cl:format cl:nil "# message format for raw sensor data~%float32[] pressure~%float32[] temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Raw>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pressure) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'temp) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Raw>))
  "Converts a ROS message object to a list"
  (cl:list 'Raw
    (cl:cons ':pressure (pressure msg))
    (cl:cons ':temp (temp msg))
))
