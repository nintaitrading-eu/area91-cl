(in-package :cl-user)
(defpackage area91.initcontroller
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.backend)
  (:import-from :area91.maincontroller
		:show-index)
  (:import-from :area91.versioncontroller
		:show-about)
  (:import-from :area91.accountcontroller
		:show-admin-account)
  (:export :*web*))
(in-package :area91.initcontroller)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

;; Main
@route GET "/"
(defun route-index ()
  (progn
  (format nil "TEST: / route")
  (show-index)))

;; Version
@route GET "/about"
(defun route-about ()
  (progn
  (format nil "TEST: /about route")
  (show-about)))

;; Admin - Account
@route GET "/admin/account"
(defun route-admin-account ()
  (progn
  (format nil "TEST: /admin/account route")
  (show-admin-account)))
  
;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
