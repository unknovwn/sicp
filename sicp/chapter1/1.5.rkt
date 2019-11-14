#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
#| Error! (p) infinitely expanded to itself
because of applicative-order evaulation. |#
