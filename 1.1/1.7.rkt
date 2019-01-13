#lang racket

; Helpers

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

; Original

(define (sqr x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  
  (sqrt-iter 1.0 x))

; Alternative

(define (alt-sqr x)
  (define (sqrt-iter guess x)
    ; An alternative strategy for implementing good-enough?
    ; is to watch how guess changes from one iteration to the next
    ; and stop when the change is a very small fraction of the guess.
    (define (good-enough? guess next)
      (< (abs (- next guess)) (* guess 1.0e-50)))

    (define next (improve guess x))
    (if (good-enough? guess next)
        guess
        (sqrt-iter next x)))

  (sqrt-iter 1.0 x))

(sqr 0.5e-4)       ; 0.031781009679092864
(alt-sqr 0.05e-4)  ; 0.00223606797749979

(sqr 16)           ; 4.000000636692939
(alt-sqr 16)       ; 4.0

(sqr 1.7e-307)     ; 0.03125
(alt-sqr 1.7e-307) ; 4.123105625617661e-154

; (sqr 1.7e+308)   ; loops infinitely because it doesn't have small enough value to satisfy good-enough?
(alt-sqr 1.7e+308) ; 1.3038404810405297e+154
