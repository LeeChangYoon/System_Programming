#lang racket


;Node
(define (node data left right)
  (cons data (cons left right)))


;Binary Tree
(define n1 (node 1 null null))
(define n3 (node 3 null null))
(define n2 (node 2 n1 n3))
(define n5 (node 5 null null))
(define n6 (node 6 n5 null))
(define n4 (node 4 n2 n6))


;Search -> Check the null cases in the recursion
(define (b-search x root)
  (cond
    ([= x (car root)] #t)
    ([< x (car root)]
     (if (equal? (car (cdr root)) null)
         #f
         (b-search x (car (cdr root)))))
    (else
     (if (equal? (cdr (cdr root)) null)
         #f
         (b-search x (cdr (cdr root)))))))


;Main
(define root n4)
(b-search 1 root)
(b-search 7 root)
