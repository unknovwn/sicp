#lang sicp

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (average3 x y z)
  (/ (+ x y z) 3))

(define (cbrt-iter guess oldguess x)
  (if (good-enough? guess oldguess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (good-enough? guess oldguess)
  (<= (abs (- guess oldguess))
      (* guess 0.001)))

(define (improve guess x)
  (average3 (/ x (square guess))
            guess
            guess))

(define (cbrt x)
  (cbrt-iter 1.0 2.0 x))
