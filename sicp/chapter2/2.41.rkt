#lang sicp

(#%require rackunit)

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (triples-of-sum s n)
  (filter (lambda (triple) (= (accumulate + 0 triple) s))
          (flatmap
           (lambda (i)
             (flatmap
              (lambda (j)
                (map (lambda (k) (list i j k))
                     (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n))))

(triples-of-sum 10 6)
                
