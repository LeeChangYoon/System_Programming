#lang racket


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.22


;Recursion

;Factorial
(define (fac n)
  (if (= n 1) 1
      (* n (fac (- n 1)))))


;Fibonacci
(define (fib n)
  (if (= n 1) 1
      (if (= n 0) 0
          (+ (fib (- n 1)) (fib (- n 2))))))


;GCD
(define (gcd a b)
  (if (= a b) a
      (if (> a b)
          (gcd (- a b) b)
          (gcd (- b a) a))))


;Sum from a to b
(define (sum a b)
  (if (= a b) a
      (+ b (sum a (- b 1)))))


;Main
(fac 5)
(fib 5)
(gcd 24 18)
(sum 1 10)

