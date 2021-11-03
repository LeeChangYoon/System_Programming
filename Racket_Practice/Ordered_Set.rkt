#lang racket
(require racket/trace)


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.25


;Ordered Search
(define (o-search x S)
  (cond
    ([equal? S null] #f)
    ([= x (car S)] #t)
    ([< x (car S)] #f)
    (else (o-search x (cdr S)))))


;Ordered Adjoin
(define (o-adjoin x S)
(cond
    ([equal? S null] (cons x '()))
    ([= x (car S)] S)
    ([< x (car S)] (cons x S))
    (else (cons (car S) (o-adjoin x (cdr S))))))


;Ordered
(define (sort S)
 (if (equal? S null) '()
  (o-adjoin (car S) (sort (cdr S)))))


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
(define oSet1 (sort Set1))
(define oSet2 (sort Set2))
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


