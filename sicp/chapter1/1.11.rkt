#lang sicp

(#%require rackunit)

#| With recursive process |#

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

#| With iterative process |#

(define (f-iter n)
  (define (iter a b c counter)
    (if (= counter 0)
        a
        (iter b c (+ c  (* 2 b) (* 3 a)) (- counter 1))))
  (iter 0 1 2 n))


(check-equal? (f-iter 0) 0)
(check-equal? (f-iter 1) 1)
(check-equal? (f-iter 2) 2)
(check-equal? (f-iter 5) 25)
(check-equal? (f-iter 12) 10661)
(check-equal? (f-iter 20) 10771211)