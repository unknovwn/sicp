#lang sicp

(#%require rackunit)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

(check-equal? ((compose square inc) 6) 49)
(check-equal? ((compose inc square) 6) 37)
