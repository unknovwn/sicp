#lang sicp

(#%require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(check-equal? (car (cons 5 1)) 5)
(check-equal? (cdr (cons 2 4)) 4)
