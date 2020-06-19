#lang racket

;===============================;
;                               ;
;               1               ;
;             1   1             ;
;           1   2   1           ;
;         1   3   3   1         ;
;       1   4   6   4   1       ;
;     1   5  10  10   5   1     ;
;   1   6  15  20  15   6   1   ;
; 1   7  21  35  35  21   7   1 ;
;                               ;
;===============================;
;                               ;
;i/j| 0  1  2  3  4  5  6  7    ;
;---+---------------------------;
; 0 | 1                         ;
; 1 | 1  1                      ;
; 2 | 1  2  1                   ;
; 3 | 1  3  3  1                ;
; 4 | 1  4  6  4  1             ;
; 5 | 1  5 10 10  5  1          ;
; 6 | 1  6 15 20 15  6  1       ;
; 7 | 1  7 21 35 35 21  7  1    ;
;                               ;
;===============================;

(define (elem i j)
  (cond ((or (< i 0) (< j 0)) 0)
        ((or (= j 0) (= i j)) 1)
        (else (+
               (elem (- i 1) (- j 1))
               (elem (- i 1) j)))))

(define (row n)
  (define (safe-order-of-magnitude x)
    (if (= x 0)
        0
        (order-of-magnitude x)))

  (define (iter i r o)
    (if (< i 0)
        r
        (iter
         (- i 1)
         (+ r (* (elem n i) (expt 10 (+ (safe-order-of-magnitude r) o))))
         1)))

  (iter n 0 0))

(define (display-row n)
  (define (iter i)
    (display (elem n i))
    (if (>= i n)
        (void)
        (iter (+ i 1))))

  (iter 0))

(row 15)         ; calculates number: 11510545513653003500564356435500530031365455105151
(display-row 15) ; logs into console: 11510545513653003500564356435500530031365455105151
