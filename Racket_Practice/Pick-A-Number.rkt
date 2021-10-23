#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Pick-a-number game

;Random answer
(define answer (random 0 100))


;Pick-A-Number
(define (pick-a-number)
  (define guess (read))

  (cond
    {[< guess answer] (display "high\n") (pick-a-number)}
    {[> guess answer] (display "low\n") (pick-a-number)}
    (else (display "hit the number\n"))))


;Main
(pick-a-number)

    

