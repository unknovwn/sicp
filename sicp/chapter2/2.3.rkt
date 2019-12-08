#lang sicp

(#%require rackunit)

(define (average a b)
  (/ (+ a b) 2))

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s))
                 (x-point (end-segment s)))
              (average (y-point (start-segment s))
                 (y-point (end-segment s)))))


(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))


(define (make-rectangle top-left bottom-right)
  (cons top-left bottom-right))

(define (rect-top-left rect) (car rect))

(define (rect-bottom-right rect) (cdr rect))

(define (rect-top-right rect)
  (make-point (x-point (cdr rect))
              (y-point (car rect))))

(define (rect-bottom-left rect)
  (make-point (x-point (car rect))
              (y-point (cdr rect))))

(define (rect-width rect)
  (- (x-point (rect-top-right rect))
     (x-point (rect-top-left rect))))

(define (rect-height rect)
  (- (y-point (rect-top-left rect))
     (y-point (rect-bottom-left rect))))

(define (rect-perimeter rect)
  (* (+ (rect-width rect)
        (rect-height rect))
     2))

(define (rect-area rect)
  (* (rect-width rect) (rect-height rect)))

(check-equal? (rect-perimeter (make-rectangle (make-point -4 -1) (make-point 0 -6))) 18)
(check-equal? (rect-area (make-rectangle (make-point 1 3) (make-point 5 -2))) 20)