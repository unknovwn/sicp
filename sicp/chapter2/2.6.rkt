#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f (n f) x))))

(define one
  (lambda (f) (lambda (x) (f (lambda (f1) (lambda (y) y))) x)))

(define two
  (lambda (f) (lambda (x) (f ((lambda (f1) (lambda (y) (f1 (lambda (f2) (lambda (z) z))) y))) x))))