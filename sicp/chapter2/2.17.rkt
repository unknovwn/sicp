#lang sicp

(#%require rackunit)

(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

(check-equal? (last-pair (list 1)) (list 1))
(check-equal? (last-pair (list 23 72 149 34)) (list 34))