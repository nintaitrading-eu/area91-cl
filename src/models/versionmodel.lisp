;;;; versionmodel.lisp

(in-package :cl-user)
(defpackage area91.versionmodel
  (:use :cl)
  (:import-from :area91.backend
		:api
		:with-connection)
  (:import-from :cl-json
                :decode-json)
  (:export :get-version-info
           :get-account-info))
(in-package :area91.versionmodel)

;;; T_VERSION
(defun get-version-info ()
  "Get application/database version info."
  ; TODO: use dexador get
  ;(with-connection (db)
  ;  (retrieve-one
  ;    (select (:application_version :application_version_info :database_version :database_version_info)
  ;      (from :t_version)))))
  ;(with-connection (api)
    (decode-json (dex:get (concatenate 'string "http://127.0.0.1:8891" "/version") :want-stream t)))
;)

;;; T_ACCOUNT
(defun get-account-info ()
  "Get account info."
  ;(with-connection (api)
    (decode-json (dex:get (concatenate 'string "http://127.0.0.1:8891" "/account") :want-stream t)))
;)
