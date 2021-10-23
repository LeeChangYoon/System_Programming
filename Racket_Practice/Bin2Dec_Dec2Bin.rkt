#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Conversion

;Dec2Bin
(define (dec2bin dec)
  (if (= dec 0) 0
      (+ (* 10 (dec2bin (floor (/ dec 2)))) (remainder dec 2))))


;Bin2Dec
(define (bin2dec bin)
  (if (= bin 0) 0
      (+ (* 2 (bin2dec (floor (/ bin 10)))) (remainder bin 10))))


;Main
(dec2bin 10)
(bin2dec 1010)