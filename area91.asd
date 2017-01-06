(in-package :cl-user)
(defpackage area91-asd
  (:use :cl :asdf))
(in-package :area91-asd)

(defsystem area91
  :version "0.1"
  :author "Andy Nagels"
  :license ""
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre
               :uiop

               ;; for @route annotation
               :cl-syntax-annot

               ;; HTML Template
               :djula

               ;; for DB
               :datafly
               :sxql
               ;; Password hashing
               :cl-pass)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db"))
                 (:file "about")
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "model" :depends-on ("db"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op area91-test))))
