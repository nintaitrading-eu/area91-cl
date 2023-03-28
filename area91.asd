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
                ((:file "init" :depends-on ("config"))
                 (:file "controllers/init" :depends-on ("view" "backend" "controllers/maincontroller" "controllers/versioncontroller" "controllers/accountcontroller"))
                 (:file "controllers/maincontroller" :depends-on ("view"))
                 (:file "controllers/versioncontroller" :depends-on ("view" "models/versionmodel"))
                 (:file "controllers/accountcontroller" :depends-on ("view" "models/accountmodel"))
                 (:file "view" :depends-on ("config"))
                 (:file "models/versionmodel" :depends-on ("backend"))
                 (:file "models/accountmodel" :depends-on ("backend"))
                 (:file "backend" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op area91-test))))
