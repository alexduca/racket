 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; ---------------------------------------------------------------------------------------------------------

; La funzione "posizione" è stata realizzata per apprendere al meglio la logica della sintassi: list-ref

(define posizione         ; val = ?
    (lambda (s i)         ; s = lista, i = intero positivo
        (if
            (= i 0)
            (car s)
            (posizione (cdr s) (- i 1))
        )
    )
)

; lista | 1 | 2 | 3 | 4 | 5 |
; -------------------------------
; conto | 0 | 1 | 2 | 3 | 4 | ...

(posizione '(1 2 3 4 5) 2)    ; return 3
(list-ref  '(1 2 3 4 5) 2)    ; return 3

; Altri esempi:
(posizione '(21 30 44) 1)           ; return 30
(posizione '(#\a #\b #\c #\d) 3)    ; return #\d
 
