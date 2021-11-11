 
; OPERAZIONI

; (+ a b)
(+ 1 2)       ; return 3

; (- a b)
(- 2 1)       ; return 1

; (* a b)
(* 2 2)       ; return 4

; (/ a b)
(/ 10 2)      ; return 5

; ------------------------------------

; OPERAZIONI A PIÙ FATTORI

; (segno a b c ... n)
(+ 1 2 3)     ; return 6

; ------------------------------------

; ESPRESSIONE A PIÙ OPERAZIONI

; (a + b) + c   ->  (+ (+ a b) c)
; es: (1 + 2) + 3
(+ (+ 1 2) 3)   ; return 6

 
