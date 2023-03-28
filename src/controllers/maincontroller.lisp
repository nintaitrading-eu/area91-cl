(in-package :cl-user)
(defpackage area91.maincontroller
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.versionmodel
        :area91.backend
        :cl-json)
  (:export :*web*))
(in-package :area91.maincontroller)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"main/main.html"))

@route GET "/about"
(defun about-page ()
  (let ((z-version-info (car (get-version-info))))
(progn
  (format t "TEST: ~a" z-version-info)
  (render #P"about/about.html"
    (list :p_appenv (appenv)
      :p_application_version (cdr (assoc :application--version z-version-info))
      :p_application_version_info (cdr (assoc :application--version--info z-version-info))
      :p_database_version (cdr (assoc :database--version z-version-info))
      :p_database_version_info (cdr (assoc :database--version--info z-version-info))))))
)

@route GET "/admin/account"
(defun admin-account-page ()
  (let ((z-account-info (get-account-info)))
  (render #P"admin/account/account.html"
    (list 
      :p_accounts z-account-info))))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
