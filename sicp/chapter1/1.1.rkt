#lang sicp

(#%require rackunit)

(define expr1 10)
(define expr2 (+ 5 3 4))
(define expr3 (- 9 1))
(define expr4 (/ 6 2))
(define expr5 (+ (* 2 4) (- 4 6)))
(define a 3)
(define b (+ a 1))
(define expr6 (+ a b (* a b)))
(define expr7 (= a b))

(define expr8
  (if (and (> b a) (< b (* a b)))
      b
      a))

(define expr9
  (cond ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25)))

(define expr10 (+ 2 (if (> b a) b a)))

(define expr11
  (* (cond ((> a b) a)
           ((< a b) b)
           (else -1))
     (+ a 1)))

(check-equal? expr1 10)
(check-equal? expr2 12)
(check-equal? expr3 8)
(check-equal? expr4 3)
(check-equal? expr5 6)
(check-equal? expr6 19)
(check-equal? expr7 #f)
(check-equal? expr8 4)
(check-equal? expr9 16)
(check-equal? expr10 6)
(check-equal? expr11 16)
