;;;; package.lisp

(defpackage #:defmacro-enhance
  (:use #:cl #:iterate)
  (:export #:defmacro! #:defmacro-driver! #:defun!
	   #:define-/g! #:define-/o! #:define-/e!
	   #:macrolet! #:labels! #:flet!))

