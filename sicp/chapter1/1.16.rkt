#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-expt b n)
  (define (iter base power acc)
    (cond ((= power 0) acc)
          ((even? power) (iter (square base) (/ power 2) acc))
          (else (iter base (- power 1) (* acc base)))))
  (iter b n 1))

(fast-expt 3 1000)
