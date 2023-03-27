(in-package :cl-user)
(defpackage area91.backend
  (:use :cl)
  (:import-from :area91.config
                :config)
  (:export :connection-settings
           :api
           :with-connection))
(in-package :area91.backend)

(defun connection-settings (&optional (api :mainapi))
  (cdr (assoc api (config :hosts))))

(defun api (&optional (api :mainapi))
  (connection-settings api))

; TODO: add route to api
(defmacro with-connection (conn &body body)
  `(let ((*connection* ,conn))
     ,@body))

;(defun get-version-info ()
  ;(with-connection (db)
  ;  (retrieve-one
  ;    (select (:application_version :application_version_info :database_version :database_version_info)
  ;      (from :t_version)))))
;)
