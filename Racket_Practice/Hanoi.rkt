#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Hanoi
(define (hanoi n start end mid)
  (cond
    ([= n 1] (printf "~s ~s\n" start end))
    (else
     (hanoi (- n 1) start mid end)
     (printf "~s ~s\n" start end)
     (hanoi (- n 1) mid start end))))


;Main
(hanoi 3 1 2 3)