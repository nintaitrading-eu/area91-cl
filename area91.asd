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

	       ;; Http client
	       :dexador

               ;; HTML Template
               :djula

               ;; Json
               :cl-json

               ;; Password hashing
               :cl-pass)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "model"))
                 (:file "about")
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config"))
                 (:file "model" :depends-on ("backend"))
                 (:file "backend" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op area91-test))))
