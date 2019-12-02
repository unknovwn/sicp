#lang sicp

(#%require rackunit)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))

(check-equal? ((repeated square 2) 5) 625)
