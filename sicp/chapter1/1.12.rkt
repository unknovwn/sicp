#lang sicp

(#%require rackunit)

(define (pascal-triangle row column)
  (if (or (= column 1) (= column row))
      1
      (+ (pascal-triangle (- row 1)
                 (- column 1))
         (pascal-triangle (- row 1) column))))

(check-equal? (pascal-triangle 1 1) 1)
(check-equal? (pascal-triangle 2 2) 1)
(check-equal? (pascal-triangle 3 1) 1)
(check-equal? (pascal-triangle 3 2) 2)
(check-equal? (pascal-triangle 4 3) 3)
(check-equal? (pascal-triangle 5 2) 4)
(check-equal? (pascal-triangle 5 3) 6)
