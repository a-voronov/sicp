#lang racket

(define (square x) (* x x))

(define (square-sum x y)
  (+
   (square x)
   (square y)))

(define (task x y z)
  (if (and (< x y) (< x z))
      (square-sum y z)
      (task y z x)))

(task 1 2 3)
(task 1 3 2)
(task 2 3 1)
(task 2 1 3)
(task 3 1 2)
(task 3 2 1)

; 13