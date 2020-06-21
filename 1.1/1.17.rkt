#lang racket

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x)
  (+ x x))

;(define (halve x) (/ x 2))

(define (halve x)
  (define (iter i r)
    (if (= r 0)
        i
        (iter (+ i 1) (- r 2))))

  (iter 0 (if (even? x) x (- x 1))))

(define (fast-mult-rec a b)
  (define na (negative? a))
  (define nb (negative? b))

  (define absa (abs a))
  (define absb (abs b))
  
  (define n
    (or (and na (not nb))
        (and nb (not na))))

  (define x (max absa absb))
  (define m (min absa absb))
 
  (define (iter i r)
    (cond ((= i 0) 0)
          ((= i 1) r)
          ((even? i) (double (iter (halve i) r)))
          (else (+ x (iter (- i 1) r)))))
  
  ((if n - +) 0 (iter m x)))

(fast-mult-rec -5 3)
