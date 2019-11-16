#lang sicp

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

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
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cbrt x)
  (cbrt-iter 1.0 2.0 x))
