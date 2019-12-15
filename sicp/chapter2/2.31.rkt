#lang sicp

(#%require rackunit)

(define (square n) (* n n))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(check-equal? (square-tree
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))
