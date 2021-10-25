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


;Eliminate
(define (eliminate str)
  (if (equal? (cdr str) null)
      '()
      (cons (car str) (eliminate (cdr str)))))


;Palindrome?
(define (palindrome? list)
  (cond
    ([equal? list null] #t)
    ([equal? (cdr list) null] #t)
    ([equal? (first list) (last list)] (palindrome? (cdr (eliminate list))))
    (else #f)))


;Palinrome-checker
(define (palindrome-checker string)
  (define list (string->list string))

  (if (palindrome? list)
      (display "The word is palindrome.\n")
      (display "The word is not palindrome.\n")))


;Main

;(trace palindrome?)
(palindrome-checker "abcdcba")
(palindrome-checker "aa")
(palindrome-checker "mom")
(palindrome-checker "abcdbbb")
  