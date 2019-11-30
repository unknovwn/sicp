#lang sicp

(#%require rackunit)

(define (identity x) x)

(define (inc x) (+ x 1))

(define (cube x) (* x x x))


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

#| Recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
|#

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (factorial n)
  (product identity 1 inc n))


(check-equal? (sum-cubes 1 10) 3025)
(check-equal? (factorial 5) 120)
