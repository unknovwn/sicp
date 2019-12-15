#lang sicp

(#%require rackunit)

(define (same-parity first . rest)
  (let ((first-parity (if (even? first)
                          even?
                          odd?)))
      (define (iter items acc)
        (if (null? items)
            (reverse acc)
            (iter (cdr items) (if (first-parity (car items))
                                  (cons (car items) acc)
                                  acc))))
    (iter rest (list first))))

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) (list 2 4 6))
