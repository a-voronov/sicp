#lang racket

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqr x)
  (sqrt-iter 1.0 x))

(sqr 4)

; 2.0000000929222947

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x) x)))

(define (new-sqr x)
  (new-sqrt-iter 1.0 x))

(new-sqr 4)

; infinite loop because `new-if` isn't a special form but a procedure, thus both `then-clause` and `else-clause` are evaluated
; while `if` or `cond` are specail forms and only needed cases are evaluated