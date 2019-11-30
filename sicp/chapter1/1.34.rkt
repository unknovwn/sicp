#lang sicp

(define (f g)
  (g 2))

(f f)
(f 2)
(2 2)
#|
Error!
application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
  arguments...:
|#
