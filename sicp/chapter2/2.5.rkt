#lang sicp

(#%require rackunit)

(define (count-0-remainder-divisions n divisor)
   (define (iter try-exp)
     (if (= 0 (remainder n (expt divisor try-exp)))
         (iter (+ try-exp 1))
         (- try-exp 1)))
   (iter 1))

(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (car z) (count-0-remainder-divisions z 2))

(define (cdr z) (count-0-remainder-divisions z 3))

(check-equal? (car (cons 3 4)) 3)
(check-equal? (cdr (cons 5 8)) 8)
