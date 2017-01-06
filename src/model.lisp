;;;; model.lisp

(in-package :cl-user)

(defpackage area91.model
  (:use :cl :sxql)
  (:import-from :area91.db
                :db
                :with-connection
                :with-transaction)
  (:import-from :datafly
                :execute
                :retrieve-all
                :retrieve-one)
  (:export :get-version-application
           :get-version-database))

(in-package :area91.model)


(defun get-version-application ()
  "Get the application version."
  (with-connection (db)
    (retrieve-one
      (select (:application_version :application_version_info)
        (from :t_version)))))

(defun get-version-database ()
  "Get the database version."
  (with-connection (db)
    (retrieve-one
      (select (:database_version :database_version_info)
        (from :t_version)))))
