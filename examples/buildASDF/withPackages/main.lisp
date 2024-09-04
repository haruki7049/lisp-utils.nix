(in-package :cl-user)
(defpackage :example
  (:export main))

(defun main
  (&rest argv)
  (print "This is example for buildASDF for-sbcl"))
