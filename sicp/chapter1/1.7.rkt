#lang sicp

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess oldguess x)
  (if (good-enough? guess oldguess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess oldguess)
  (<= (abs (- guess oldguess))
     (* guess 0.001)))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))
