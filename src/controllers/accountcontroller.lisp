(in-package :cl-user)
(defpackage area91.accountcontroller
  (:use :cl
        :caveman2
        :area91.config
        :area91.view
        :area91.accountmodel
        :area91.backend)
  (:export :show-admin-account))
(in-package :area91.accountcontroller)

(defun show-admin-account ()
  ; Show an admin page for the account.
  (let ((z-account-info (get-account-info)))
  (render #P"admin/account/account.html"
    (list 
      :p_accounts z-account-info))))
