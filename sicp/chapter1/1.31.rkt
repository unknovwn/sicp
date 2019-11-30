#lang sicp

(#%require rackunit)

(define (identity x) x)

(define (inc x) (+ x 1))

(define (even? x)
  (= (remainder x 2) 0))

(define PI 3.14159265359)


(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

#| Recursive process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))
|#

(define (factorial n)
  (product identity 1 inc n))

(define (pi-prod a b)
  (define (pi-term x)
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (product pi-term a inc b))

(check-equal? (factorial 5) 120)
(check-within (* 4 (pi-prod 1 1000)) PI 0.01)
