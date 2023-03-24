(in-package :cl-user)
(defpackage area91.web
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.model
        :area91.backend
        :cl-json)
  (:export :*web*))
(in-package :area91.web)

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
  (let ((z-version-info (get-version-info)))
  (render #P"about/about.html"
    (list :p_appenv (appenv)
      :p_application_version (nth 1 z-version-info)
      :p_application_version_info (nth 3 z-version-info)
      :p_database_version (nth 5 z-version-info)
      :p_database_version_info (nth 7 z-version-info)))))

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
