(in-package :cl-user)
(defpackage area91.versioncontroller
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.versionmodel
        :area91.backend)
  (:export :show-about))
(in-package :area91.versioncontroller)

(defun show-about ()
  ; Show an about page with application and database version.
  (let ((z-version-info (car (get-version-info))))
(progn
  (format t "TEST: ~a" z-version-info)
  (render #P"about/about.html"
    (list :p_appenv (appenv)
      :p_application_version (getf z-version-info :|application_version|)
      :p_application_version_info (getf z-version-info :|application_version_info|)
      :p_database_version (getf z-version-info :|database_version|)
      :p_database_version_info (getf z-version-info :|database_version_info|)))))
)
