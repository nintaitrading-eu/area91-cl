;;;; versionmodel.lisp

(in-package :cl-user)
(defpackage area91.accountmodel
  (:use :cl)
  (:import-from :area91.backend
		:api
		:with-connection)
  (:import-from :jonathan
                :parse)
  (:export :get-account-info))
(in-package :area91.accountmodel)

;;; T_ACCOUNT
(defun get-account-info ()
  "Get account info."
  ;(with-connection (api)
  (progn
    (format t ":::DEBUG::: ~A" (parse (dex:get (concatenate 'string "http://127.0.0.1:8891" "/account")) :as :plist))
    (parse (dex:get (concatenate 'string "http://127.0.0.1:8891" "/account")) :as :plist)))
;)
