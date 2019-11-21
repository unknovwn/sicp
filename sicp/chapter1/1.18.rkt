#lang sicp

(#%require rackunit)

(define (even? x)
  (= (remainder x 2) 0))

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (iter (double a) (halve b) acc))
          (else (iter a (- b 1) (+ acc a)))))
  (iter a b 0))

(check-equal? (* 3 0) 0)
(check-equal? (* 2 1) 2)
(check-equal? (* 3 2) 6)
(check-equal? (* 2 4) 8)
(check-equal? (* 5 8) 40)