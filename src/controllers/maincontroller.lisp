(in-package :cl-user)
(defpackage area91.maincontroller
  (:use :cl
        :caveman2
        :area91.view
        :area91.backend)
  (:export :show-index))
(in-package :area91.maincontroller)


(defun show-index ()
  ; Shows an index page.
  (render #P"main/main.html"))
