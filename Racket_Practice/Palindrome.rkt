#lang racket
(require racket/trace)


;Name: Lee Chang Yoon
;ID: 32183641
;Date: 2021.10.25


;First
(define (first str) (car str)) 

;Last
(define (last str)
  (if (equal? (cdr str) null)
      (car str)
      (last (cdr str))))


;First-1

(define (first-1 list) (cdr list))


;Last-1

(define (last-1 list)
  (if (equal? (cdr list) null) '()
      (cons (car list) (last-1 (cdr list)))))


;Palindrome?
(define (palindrome? str)
  (define list (string->list str))

  (cond
    ([equal? list null] #t)
    ([equal? (cdr list) null] #t)
    ([equal? (first list) (last list)]
      (define str (list->string (first-1 (last-1 list))))
      (palindrome? str))
    (else #f)))



;Main
(palindrome? "abcdcba")
(palindrome? "aa")
(palindrome? "mom")
(palindrome? "abcdbbb")
  