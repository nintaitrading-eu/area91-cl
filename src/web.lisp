(in-package :cl-user)
(defpackage area91.web
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.db
        :datafly
        :sxql)
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
  (render #P"about/about.html"
    (list :app-env (appenv)
          :application_version "0.0.1"
          :application_version_info "Add something here?")))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
