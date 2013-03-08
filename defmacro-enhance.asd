;;;; defmacro-enhance.asd

(asdf:defsystem #:defmacro-enhance
  :serial t
  :description "Deformation of defmacro to defmacro!, macrolet to macrolet! etc. in spirit of let-over-lambda."
  :version "0.2"
  :author "Alexander Popolitov <popolit@itep.ru>"
  :license "GPL"
  ;; do not depend ot rutils, since I plan to rewrite anaphoric macros there with help of this package
  :depends-on (#:alexandria #:iterate)
  :components ((:file "package")
               (:file "defmacro-enhance")))

(asdf:defsystem #:defmacro-enhance-test
  :depends-on (#:defmacro-enhance #:rt)
  :components ((:file "tests")))

(defmethod perform ((o test-op) (c (eql (find-system :defmacro-enhance))))
  (operate 'load-op #:defmacro-enhance-test)
  (operate 'test-op #:defmacro-enhance-test :force t))

(defmethod perform ((o test-op) (c (eql (find-system :defmacro-enhance-test))))
  (or (funcall (intern "DO-TESTS" :rt))
      (error "test-op failed")))


