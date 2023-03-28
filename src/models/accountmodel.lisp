;;;; versionmodel.lisp

(in-package :cl-user)
(defpackage area91.accountmodel
  (:use :cl)
  (:import-from :area91.backend
		:api
		:with-connection)
  (:import-from :cl-json
                :decode-json)
  (:export :get-account-info))
(in-package :area91.accountmodel)

;;; T_ACCOUNT
(defun get-account-info ()
  "Get account info."
  ;(with-connection (api)
    (decode-json (dex:get (concatenate 'string "http://127.0.0.1:8891" "/account") :want-stream t)))
;)
