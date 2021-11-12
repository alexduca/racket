 
; STRING APPEND
; Attaccare assieme due o più parti di stringhe.

(string-append "aaa" "bbb")                 ; return "aaabbb"
(string-append "aaa" "bbb" "ccc" "ddd")     ; return "aaabbbcccddd"

; Esempio di una funzione con "string-append"

(define unisci
    (lambda (a b)
        (string-append a b)
    )
)

(unisci "ca" "sa")        ; return "casa"
 
