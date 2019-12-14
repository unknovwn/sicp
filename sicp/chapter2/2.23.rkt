#lang sicp

#|
(define (for-each proc l)
  (cond ((null? l) #t)
        (else (proc (car l))
              (for-each proc (cdr l)))))
|#

(define (for-each proc l)
  (map proc l)
  #t)
