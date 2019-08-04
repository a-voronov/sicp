#lang racket

(define (inc a)
  (+ a 1))

(define (dec a)
  (- a 1))

(define (rec-sum a b)
  (if (= a 0)
      b
      (inc (rec-sum (dec a) b))))

(define (iter-sum a b)
  (if (= a 0)
      b
      (iter-sum (dec a) (inc b))))

(rec-sum 4 5)
; (inc (rec-sum 3 5))
; (inc (inc (rec-sum 2 5)))
; (inc (inc (inc (rec-sum 1 5))))
; (inc (inc (inc (inc (rec-sum 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

(iter-sum 4 5)
; (iter-sum 3 6)
; (iter-sum 2 7)
; (iter-sum 1 8)
; (iter-sum 0 9)
; 9