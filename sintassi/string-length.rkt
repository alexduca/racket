 
; STRING LENGTH
; Calcola la lunghezza della stringa

(string-append "casa")            ; return 4
(string-append "benvenuto")       ; return 9

; Esempio di una funzione con "string-length"

(define lunghezza
    (lambda (str)
        (string-length str)
    )
)

(lunghezza "ciao")                ; return 4
 
