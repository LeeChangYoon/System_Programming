#lang racket
(require racket/trace)


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.25


;Ordered Search
(define (o-search x oSet)
  (cond
    ([equal? oSet null] #f)
    ([= x (car oSet)] #t)
    ([< x (car oSet)] #f)
    (else (o-search x (cdr oSet)))))


;Ordered Adjoin
(define (o-adjoin x oSet)
  (cond
    ([equal? oSet null] (cons x '()))
    ([= x (car oSet)] oSet)
    ([< x (car oSet)] (cons x oSet))
    (else (cons (car oSet) (o-adjoin x (cdr oSet))))))


;Ordered
(define (ordered Set)
  (if (equal? Set null)
      '()
      (o-adjoin (car Set) (ordered (cdr Set)))))


;Ordered Subtract
(define (o-subtract A B)
  (cond
    ([equal? A null] A)
    ([equal? B null] A)
    ([< (car A) (car B)] (cons (car A) (o-subtract (cdr A) B)))
    ([> (car A) (car B)] (o-subtract A (cdr B)))
    (else (o-subtract (cdr A) (cdr B)))))


;Ordered Union
(define (o-union A B)
  (cond
    ([equal? A null] B)
    ([equal? B null] A)
    ([< (car A) (car B)] (cons (car A) (o-union (cdr A) B)))
    ([> (car A) (car B)] (cons (car B) (o-union A (cdr B))))
    (else (cons (car A) (o-union (cdr A) (cdr B))))))
          

;Main
(define Set1 '(9 3 1 7 5))
(define Set2 '(5 3 2 4))

;(trace ordered)
(define oSet1 (ordered Set1))
(define oSet2 (ordered Set2))
;(ordered '(1 1 1 1 1))
;(ordered '(1 3 5 7 9))
;(ordered '(9 1 3 5 7 ))
;(ordered '(9 7 5 3 1))

;(trace o-search)
(o-search 3 oSet1)

;(trace o-adjoin)
(o-adjoin 4 oSet1)

;(trace o-subtract)
(o-subtract oSet1 oSet2)

;(trace o-union)
(o-union oSet1 oSet2)


