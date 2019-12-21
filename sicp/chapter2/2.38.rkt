#lang sicp

(#%require rackunit)

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest) result)
              (cdr rest))))
  (iter initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(check-equal? (fold-right / 1 (list 1 2 3)) 3/2)
(check-equal? (fold-left / 1 (list 1 2 3)) 1/6)
(check-equal? (fold-right list nil (list 1 2 3)) (list 3(list 2(list 1 nil))))
(check-equal? (fold-left list nil (list 1 2 3)) (list (list (list nil 1) 2) 3))
(check-equal? (fold-left + 0 (list 1 2 3)) (fold-right + 0 (list 1 2 3)))
