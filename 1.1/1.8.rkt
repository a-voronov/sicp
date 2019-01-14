#lang racket

(define (square x) (* x x))

; x/y² + 2y
; ---------
;     3

(define (improve guess x)
  (/
   (+
    (/ x (square guess))
    (* 2 guess))
   3))

(define (cbrt x)
  (define (cbrt-iter guess x)
    (define (good-enough? guess next)
      (< (abs (- next guess)) (* guess 1.0e-50)))

    (define next (improve guess x))
    (if (good-enough? guess next)
        guess
        (cbrt-iter next x)))

  (cbrt-iter 1.0 x))

(cbrt 0.27e+308) ; 3.0000000000000003e+102
(cbrt 0.27e-307) ; 3e-103

; (cbrt 0)       ; loops infinitely
; (cbrt -1)      ; loops infinitely