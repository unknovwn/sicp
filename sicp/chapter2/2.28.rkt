#lang sicp

(#%require rackunit)

(define (fringe tree)
  (define (iter rest acc)
    (cond ((null? rest)
           acc)
          ((not (pair? (car rest)))
           rest)
          (else
           (iter (cdr rest) (append acc (iter (car rest) (list )))))))
  (iter tree (list )))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
