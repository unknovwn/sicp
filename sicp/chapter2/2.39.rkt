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

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y) (cons x y)) nil sequence))

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(check-equal? (reverse-fold-right (list 1 2 3)) (list 3 2 1))
(check-equal? (reverse-fold-left (list 1 2 3)) (list 3 2 1))
