#lang sicp

(#%require rackunit)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
                         (if (pair? node)
                             (count-leaves node)
                             1))
                       t)))

(check-equal? (count-leaves (list 1 (list 2 3) (list 4))) 4)
