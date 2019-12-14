#lang sicp

(#%require rackunit)

(define (reverse l)
  (define (iter rest acc)
    (if (null? rest)
        acc
        (iter (cdr rest) (cons (car rest) acc))))
  (iter l nil))

(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))
