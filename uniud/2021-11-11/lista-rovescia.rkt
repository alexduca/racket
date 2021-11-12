 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; La funzione "rovescia" è stata realizzata per apprendere al meglio la logica della sintassi: reverse

; ----------------------------------------------------------------------------------------------------------------------------------------------------------

; Metodo 1
(define rovescia        ; val: lista
    (lambda (s)         ; s:   lista
        (if (null? s)               ; verifico se la lista è vuota
            null                    ; se la lista è vuota restituisco una lista vuota
            (giustapponi            ; se la lista non è vuota restituisce la parte restante della lista + il primo argomento della lista successivamente
                (rovescia (cdr s)) 
                (cons (car s) null)  
            )
        )
    )
)

(rovescia '(6 7 8 9))     ; return '(9 8 7 6)
(reverse '(7 8 9))        ; return '(9 8 7)

; ----------------------------------------------------------------------------------------------------------------------------------------------------------

; Metodo 2
(define rovescia2
    (lambda (s)
        (rovescia-rec s null)
    )
)
(define rovescia-rec                    ; val:  lista
    (lambda (s r)                       ; s, r: liste
        (if
            (null? s)                   ; verifico se s è vuoto
            r                           ; in tal caso restituisco r (sperando non sia vuoto)
            (rovescia-rec
                (cdr s)
                (cons (car s) r)
            )
        )
    )
)

(rovescia2 '(7 8 9))      ; return '(9 8 7)
 
