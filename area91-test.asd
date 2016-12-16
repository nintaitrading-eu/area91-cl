(in-package :cl-user)
(defpackage area91-test-asd
  (:use :cl :asdf))
(in-package :area91-test-asd)

(defsystem area91-test
  :author "Andy Nagels"
  :license ""
  :depends-on (:area91
               :prove)
  :components ((:module "t"
                :components
                ((:file "area91"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
