#lang sicp

(#%require rackunit)

(define (even? x)
  (= (remainder x 2) 0))

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))

(check-equal? (* 3 0) 0)
(check-equal? (* 2 1) 2)
(check-equal? (* 3 2) 6)
(check-equal? (* 2 4) 8)
(check-equal? (* 5 8) 40)
  