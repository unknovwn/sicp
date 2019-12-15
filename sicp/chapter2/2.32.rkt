#lang sicp

(#%require rackunit)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(check-equal? (subsets (list 1 2 3)) (list
                                      (list)
                                      (list 3)
                                      (list 2)
                                      (list 2 3)
                                      (list 1)
                                      (list 1 3)
                                      (list 1 2)
                                      (list 1 2 3)))