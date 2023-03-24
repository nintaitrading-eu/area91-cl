(in-package :cl-user)
(defpackage area91.backend
  (:use :cl)
  (:import-from :area91.config
                :config)
  (:export :connection-settings
           :db
           :with-connection
           :with-transaction))
(in-package :area91.backend)

(defun connection-settings (&optional (db :maindb))
  (cdr (assoc db (config :databases))))

(defun db (&optional (db :maindb))
  (apply #'connect-cached (connection-settings db)))

(defmacro with-connection (conn &body body)
  `(let ((*connection* ,conn))
     ,@body))

(defmacro with-transaction (conn &body body)
  `(let ((*connection* ,conn))
     (cl-dbi:with-transaction *connection*
        ,@body)))
