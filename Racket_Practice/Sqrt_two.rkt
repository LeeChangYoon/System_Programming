#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Square root of two

;Good?
(define (good? x)
  (if (< x 0.001) #t #f))


;Square
(define (square x) (* x x))


;Average
(define (average a b) (/ (+ a b) 2))


;Improve
(define (improve g x) (average g (/ x g)))


;Difference
(define (differ g x)
  (if (< (square g) x)
      (- x (square g))
      (- (square g) x)))
      

;Sqrt-iter
(define (sqrt-iter x g)
  (if (good? (differ g x))
      g
      (sqrt-iter x (improve g x))))


;Sqrt
(define (sqrt x)
  (define g 1.0)
  (sqrt-iter x g))


;Main
(sqrt 2)
