#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Set Operation

;Search
(define (search x S)
  (if (equal? S null) #f
      (if (= x (car S)) #t
          (search x (cdr S)))))


;Adjoin
(define (adjoin x S)
  (if (search x S) S
      (cons x S)))


;Union
(define (union S1 S2)
  (if (equal? S1 null) S2
      (adjoin (car S1) (union (cdr S1) S2))))


;Subtract
(define (subtract A B)
  (if (equal? A null) A
      (if (search (car A) B)
          (subtract (cdr A) B)
          (adjoin (car A) (subtract (cdr A) B)))))


;Main
(define A '(1 3 5 7 9))
(define B '(2 3 4 5))
(union A B)
(subtract A B)
  
  