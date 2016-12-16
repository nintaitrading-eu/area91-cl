(in-package :cl-user)
(defpackage area91
  (:use :cl)
  (:import-from :area91.config
                :config)
  (:import-from :clack
                :clackup)
  (:export :start
           :stop))
(in-package :area91)

(defvar *appfile-path*
  (asdf:system-relative-pathname :area91 #P"app.lisp"))

(defvar *handler* nil)

(defun start (&rest args &key server port debug &allow-other-keys)
  (declare (ignore server port debug))
  (when *handler*
    (restart-case (error "Server is already running.")
      (restart-server ()
        :report "Restart the server"
        (stop))))
  (setf *handler*
        (apply #'clackup *appfile-path* args)))

(defun stop ()
  (prog1
      (clack:stop *handler*)
    (setf *handler* nil)))
