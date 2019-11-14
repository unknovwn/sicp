#lang sicp

(#%require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|
(a-plus-abs-b 4 -12)
((if (> -12 0) + -) 4 -12)
((if #f + -) 4 -12)
(- 4 -12)
16

(a-plus-abs-b 4 12)
((if (> 12 0) + -) 4 12)
((if #t + -) 4 12)
(+ 4 12)
16
|#

(check-equal? (a-plus-abs-b 4 -12) 16)
(check-equal? (a-plus-abs-b 4 12) 16)
