#lang racket

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination kinds-of-coins))
		     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))

(count-change 11)

; (11 5) → (-39 5)
;        → (11 4) → (-14 4)
;                 → (11 3) → (1 3) → (-9 3)
;                                  → (1 2) → (-4 2)
;                                          → (1 1) → (0 1) !
;                                                  → (1 0)
;
;                          → (11 2) → (6 2) → (1 2) → (-4 2)
;                                                   → (1 1) → (0 1) !
;                                                           → (1 0)
;
;                                           → (6 1) → (6 0)
;                                                   → (5 1) → (5 0)
;                                                           → (4 1) → (4 0)
;                                                                   → (3 1) → (3 0)
;                                                                           → (2 1) → (2 0)
;                                                                                   → (1 1) → (0 1) !
;                                                                                           → (1 0)
;
;                                   → (11 1) → (11 0)
;                                            → (10 1) → (10 0)
;                                                     → (9 1) → (9 0)
;                                                             → (8 1) → (8 0)
;                                                                     → (7 1) → (7 0)
;                                                                             → (6 1) → (6 0)
;                                                                                     → (5 1) → (5 0)
;                                                                                             → (4 1) → (4 0)
;                                                                                                     → (3 1) → (3 0)
;                                                                                                             → (2 1) → (2 0)
;                                                                                                                     → (1 1) → (0 1) !
;
;
; Answer: 4

; (cc n k) => O(n^k)
; (count-change n) => O(n^5)