#lang racket

(define (square x) 
  (* x x))

(define (improve guess x) ; отношение x/y
  (average guess (/ x guess)))

(define (average x y) ; среднее значение
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;(new-if (= 2 3) 0 5)
;5
;(new-if (= 1 1) 0 5)
;0

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))

(define (sqrt-iter-or guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter-or (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-or x)
  (sqrt-iter-or 1.0 x))

;(sqrt 4)
(sqrt-or 4)