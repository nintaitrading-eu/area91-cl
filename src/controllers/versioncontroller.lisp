(in-package :cl-user)
(defpackage area91.versioncontroller
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.versionmodel
        :area91.backend
        :cl-json)
  (:export :show-about))
(in-package :area91.versioncontroller)

(defun show-about ()
  ; Show an about page with application and database version.
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
