#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; applicative-order-evaluation: will run into recusrive loop, because all arguments are evaluated first
; normal-order-evaluation: will return 0, because second argument won't be evaluated at all, as it's not needed
