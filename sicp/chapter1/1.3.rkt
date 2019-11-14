#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square-largest-sum a b c)
  (cond ((and (>= a c) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= b a) (>= c a)) (sum-of-squares b c))))

(check-equal? (square-largest-sum 1 2 3) 13)
(check-equal? (square-largest-sum 1 1 1) 2)
(check-equal? (square-largest-sum 1 2 2) 8)
(check-equal? (square-largest-sum 3 3 2) 18)
