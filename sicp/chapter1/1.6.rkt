#lang sicp

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter guess x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(new-sqrt 5)
#| Error! Endless recursion because new-if has applicative-order
 evaulation and trying to evaulate new-sqrt-iter |#