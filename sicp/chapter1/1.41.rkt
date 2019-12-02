#lang sicp

(#%require rackunit)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (biquadrate x) ((double square) x))

(check-equal? ((double inc) 1) 3)
(check-equal? (biquadrate 3) 81)
