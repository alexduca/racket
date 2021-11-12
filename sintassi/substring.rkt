 
; SUBSTRING
; Estrai una specifica parte di una stringa

; (substring "parola" n1 n2)
(substring "parola" 0 2)          ; return "pa"
(substring "parola" 3 5)          ; return "ol"
(substring "parola" 0 3)          ; return "paro"

; (substring "parola" n1)
(substring "parola" 2)            ; return "rola"
(substring "parola" 0)            ; return "parola"

; --------------------------------------------------------------

; Esempio di una funzione con "substring"
; Questa funzione estrae le prime due lettere di una parola

(define primedue
    (lambda (str)
        (substring str 0 2)
    )
)

(primedue "gatto")                ; return "ga"
 
