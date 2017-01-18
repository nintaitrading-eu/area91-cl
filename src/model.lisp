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

;;; T_VERSION
(defun get-version-info ()
  "Get application/database version info."
  (with-connection (db)
    (retrieve-one
      (select (:application_version :application_version_info :database_version :database_version_info)
        (from :t_version)))))

;;; T_ACCOUNT
(defun get-account-info ()
  "Get account info."
  (with-connection (db)
    (retrieve-one
      (select (:*) (from :t_account)))))
