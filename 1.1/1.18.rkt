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

(define (fast-mult-iter a b)
  (define na (negative? a))
  (define nb (negative? b))

  (define absa (abs a))
  (define absb (abs b))
  
  (define n
    (or (and na (not nb))
        (and nb (not na))))

  (define x (max absa absb))
  (define m (min absa absb))
 
  (define (iter i ir r)
    (cond ((= i 0) r)
          ((even? i) (iter (halve i) (double ir) r))
          (else (iter (- i 1) ir (+ ir r)))))
  
  ((if n - +) 0 (iter m x 0)))

(fast-mult-iter 50000000 -30000000)
