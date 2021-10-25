#lang racket
(require racket/trace)

;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.23


;Set Operation in Ordered Set

;Ordered? -> O(n)
(define (ordered S)
  (if (equal? S null)
    '()
    (ordered-adjoin (car S) (ordered (cdr S)))))
      

;Search in ordered set -> O(x), worst: O(n)
;We can also use the binary search... -> O(logn)
(define (ordered-search x S)
  (cond
    ([equal? S null] #f)
    ([> (car S) x] #f)
    ([= (car S) x] #t)
    (else (ordered-search x (cdr S)))))


;Adjoin in ordered set
(define (ordered-adjoin x S)
  (cond
    ([equal? S null] (cons x null))
    ([> x (car S)] (cons (car S) (ordered-adjoin x (cdr S))))
    ([= x (car S)] S)
    (else (cons x S))))


;Subtract in ordered set
(define (ordered-subtract A B)
  (cond
    ([equal? A null] A)
    ([equal? B null] A)
    ([< (car A) (car B)] (cons (car A) (ordered-subtract (cdr A) B)))
    ([> (car A) (car B)] (ordered-subtract A (cdr B)))
    (else (ordered-subtract (cdr A) (cdr B)))))


;Union
(define (ordered-union A B)
  (cond
    ([equal? A null] B)
    ([equal? B null] A)
    ([< (car A) (car B)] (cons (car A) (ordered-union (cdr A) B)))
    ([> (car A) (car B)] (cons (car B) (ordered-union A (cdr B))))
    (else (cons (car A) (ordered-union (cdr A) (cdr B))))))
  

;Main
(define x1 5)
(define x2 10)
(define S1 '(7 9 1 3 4 6 2 8 5))
(define S2 '(3 5 7 9 11 15))
(define ordered_S1 (ordered S1))

(ordered-search x1 ordered_S1)
(define A (ordered-adjoin x2 ordered_S1))

;(trace ordered-subtract)
;(trace ordered-union)
(ordered-subtract A S2)
(ordered-union A S2)
  