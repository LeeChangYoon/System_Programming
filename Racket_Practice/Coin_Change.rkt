#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Counting change

;Coin
(define (coin n)
  (cond
    [(= n 1) 10]
    [(= n 2) 50]
    [(= n 3) 100]
    [(= n 4) 500]
    [(= n 5) 1000]
    [(= n 6) 5000]))


;Change coin
(define (cc amount n)
  (if (= n 0) 0
      (if (= amount 0) 1
          (if (< amount 0) 0
              (+ (cc (- amount (coin n)) n) (cc amount (- n 1)))))))


;Main
(cc 10000 6)
          