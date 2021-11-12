 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; ---------------------------------------------------------------------------------------------------------

; La funzione "giustapponi" è stata realizzata per apprendere al meglio la logica della sintassi: append
; Strutturalmente viene eliminata una delle due liste '() spostando gli elementi nell'altra

(define giustapponi
    (lambda (s t)
        (cond
            ((null? s) t)     ; se S è vuoto ritorna solo T
            ((null? t) s)     ; se T è vuoto ritorna solo T
            (else
                (cons
                    (car s)
                    (giustapponi (cdr s) t)
                )
            )
        )
    )
)

(giustapponi '(1 2 3) '(4 5))             ; return '(1 2 3 4 5)
(append '(1 2 3) '(4 5))                  ; return '(1 2 3 4 5)

; Altri esempi:
(giustapponi '(12 14 16) '(84 86 88))     ; return '(12 14 16 84 86 88)
(giustapponi '(#\a #\b) '(#\p #\s))       ; return '(#\a #\b #\p #\s)
 
