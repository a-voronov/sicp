#lang racket

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  
  ; f(n) = f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)
  ;            x              y              z
  (define (iter x y z i)
    (cond ((< i 0) n)
          ((= i 0) x)

          ; f(3) = f(2) + 2 * f(1) + 3 * f(0)
          ;  |      2           1          0
          ;  |      ↓           ↓          ↓    
          ;  |      x           y          z
          ;  ↓      ↓           ↓
          ;  x'     y'          z'
          ; f(4) = f(3) + 2 * f(2) + 3 * f(1)
          ;  |      x'          y'         z'
          ;  ↓      ↓           ↓
          ;  x"     y"          z"
          ; f(5) = f(4) + 2 * f(3) + 3 * f(2)
          ;  |      x"          y"         z"
          ;  ↓      ↓           ↓
          ;  x'"    y'"         z'"
          (else (iter
                 (+ x (* 2 y) (* 3 z))
                 x
                 y
                 (- i 1)))))
  
  ; let: n = 3, where: n < 3 = n, then:
  ;
  ; f(n - 1) = f(2) = 2
  ; f(n - 2) = f(1) = 1
  ; f(n - 3) = f(0) = 0
  (iter 2 1 0 (- n 2)))

(f-rec 1)    ; 1
(f-iter 1)   ; 1

(f-rec 32)   ; few seconds => 345910235915
(f-iter 32)  ; immediately => 345910235915

;(f-rec 320) ; could've counted to infinity. twice.
(f-iter 320) ; immediately => 500879968802515568936855830022492984814181884387549680656867786545457275665771739950986902556372887706899993643084082525
