#lang sicp

(#%require rackunit)

(define (identity x) x)

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (smallest-divisor n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(define (prime? n)
  (if (<= n 1) false
      (= n (smallest-divisor n))))

(define (gcd a b)
  (cond ((< a b) (gcd b a))
        ((= b 0) a)
        (else (gcd b (remainder a b)))))


(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-of-relative-primes n)
  (define (filter x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 identity 1 inc n filter))

(check-equal? (sum-of-prime-squares 1 10) 87)
(check-equal? (product-of-relative-primes 10) 189)
