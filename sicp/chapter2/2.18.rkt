#lang sicp

(#%require rackunit)

(define (reverse items)
  (define (iter items acc)
    (if (null? items)
        acc
        (iter (cdr items) (cons (car items) acc))))
  (iter items nil))

(check-equal? (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))