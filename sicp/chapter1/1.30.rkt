#lang sicp

(#%require rackunit)

(define (identity x) x)

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define PI 3.14159265359)


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-integers a b)
  (sum identity a inc b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))


(check-equal? (sum-integers 1 10) 55)
(check-equal? (sum-cubes 1 10) 3025)
(check-within (* 8 (pi-sum 1 10000)) PI 0.01)
