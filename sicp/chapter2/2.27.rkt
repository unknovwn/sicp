#lang sicp

(#%require rackunit)

(define (deep-reverse tree)
  (define (iter rest acc)
    (if (null? rest)
        acc
        (let ((first (car rest)))
          (iter (cdr rest)
                (cons (if (not (pair? first))
                          first
                          (deep-reverse first))
                      acc)))))
  (iter tree nil))

(define x (list (list 1 2) (list 3 4)))

(check-equal? (deep-reverse x) (list (list 4 3) (list 2 1)))
