;;;; model.lisp

(in-package :cl-user)
(defpackage area91.model
  (:use :cl)
  (:export :get-version-info
           :get-account-info))
(in-package :area91.model)

;;; T_VERSION
(defun get-version-info ()
  "Get application/database version info."
  ; TODO: use dexador get
  ;(with-connection (db)
  ;  (retrieve-one
  ;    (select (:application_version :application_version_info :database_version :database_version_info)
  ;      (from :t_version)))))
  (princ "NOT IMPLEMENTED YET...")
)

;;; T_ACCOUNT
(defun get-account-info ()
  "Get account info."
  ; TODO: use dexador get
  (princ "NOT IMPLEMENTED YET...")
  ;(with-connection (db)
  ;  (retrieve-one
  ;    (select (:*) (from :t_account)))))
)
