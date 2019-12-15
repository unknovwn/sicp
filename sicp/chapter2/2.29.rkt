#lang sicp

(#%require rackunit)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (has-submobiles? branch)
  (pair? (branch-structure branch)))

(define (branch-weight branch)
  ((if (not (has-submobiles? branch))
            branch-structure
            total-weight)
   branch))

(define (torque branch)
  (if (has-submobiles? branch)
      0
      (* (branch-length branch)
         (branch-weight branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-balanced? branch)
  (if (not (has-submobiles? branch))
      #t
      (mobile-balanced? (branch-structure branch))))

(define (mobile-balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (torque left) (torque right))
         (branch-balanced? left)
         (branch-balanced? right))))

(define x (make-mobile
           (make-branch 4 5)
           (make-branch 10 2)))

(define y (make-mobile
           (make-mobile
            (make-mobile
             (make-branch 1 2)
             (make-branch 3 4))
            (make-mobile
             (make-branch 5 6)
             (make-mobile 7 8)))
           (make-mobile
            (make-branch 9 10)
            (make-mobile
             (make-branch 11 12)
             (make-branch 13 14)))))

(check-true (mobile-balanced? x))
(check-false (mobile-balanced? y))
