#lang racket

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;; simple exponentiation with recursive process - space: O(n), time: O(n)

;(define (expt b n)
;  (if (= n 0)
;      1
;      (* b (expt b (- n 1)))))

;; simple exponentiation with iterative process - space: O(1), time: O(n)

(define (expt b n)
  (define (iter b i r)
    (if (= i 0)
        r
        (iter b (- i 1) (* b r))))

  (iter b n 1))

;; fast exponentiation with recursive process - space: O(log n), time: O(log n)

;(define (fast-expt b n)
;  (cond ((= n 0) 1)
;        ((even? n) (square (fast-expt b (/ n 2))))
;        (else (* b (fast-expt b (- n 1))))))

;; fast exponentiation with iterative process - space: O(1), time: O(log n)

(define (fast-expt b n)
  (define (iter b i r)
    (cond ((= i 0) r)
          ((even? i) (iter (square b) (/ i 2) r))
          (else (iter b (- i 1) (* b r)))))

  (iter b n 1))

(expt 4 12)
(fast-expt 4 12)
