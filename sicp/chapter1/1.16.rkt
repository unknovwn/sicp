#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-expt b n)
  (define (iter base power acc)
    (cond ((= power 0) acc)
          ((even? power) (iter (square base) (/ power 2) acc))
          (else (iter base (- power 1) (* acc base)))))
  (iter b n 1))

(check-equal? (fast-expt 15 0) 1)
(check-equal? (fast-expt 15 1) 15)
(check-equal? (fast-expt 3 3) 27)
(check-equal? (fast-expt 5 5) 3125)


