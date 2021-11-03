#lang racket
(require racket/trace)


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.25


;Ordered Search
(define (o-search x oSet)
  (if (equal? oSet null) #f
      (if (= x (car oSet)) #t
          (if (< x (car oSet)) #f
              (o-search x (cdr oSet))))))


;Ordered Adjoin
(define (o-adjoin x oSet)
  (if (equal? oSet null) (cons x '())
      (if (= x (car oSet)) oSet
          (if (< x (car oSet)) (cons x oSet)
              (cons (car oSet) (o-adjoin x (cdr oSet)))))))


;Ordered
(define (ordered Set)
  (if (equal? Set null)
      '()
      (o-adjoin (car Set) (ordered (cdr Set)))))


;Ordered Subtract
(define (o-subtract A B)
  (if (equal? A null) A
      (if (equal? B null) A
          (if (< (car A) (car B))
              (cons (car A) (o-subtract (cdr A) B))
              (if (> (car A) (car B))
                  (o-subtract A (cdr B))
                  (o-subtract (cdr A) (cdr B)))))))


;Ordered Union
(define (o-union A B)
  (if (equal? A null) B
      (if (equal? B null) A
          (if (< (car A) (car B))
              (cons (car A) (o-union (cdr A) B))
              (if (> (car A) (car B))
                  (cons (car B) (o-union A (cdr B)))
                  (cons (car A) (o-union (cdr A) (cdr B))))))))
          


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


