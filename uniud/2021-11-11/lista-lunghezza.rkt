 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca
; Esercizio svolto in autonomia in seguito alla richiesta del docente per esercitarsi con racket

; -------------------------------------------------------------------------------------------------------------------------------------------------------

; Esercizio -> Realizzare una funzione che restituisca la lunghezza della lista sotto forma di numero intero positivo

(define lunghezza                   ; val:  intero positivo
    (lambda (s)                     ; s:    lista
        (if
            (null? s) 0               ; se la lista è vuota ritorna 0
            (lunghezza-calc s 1)      ; se la lista non è vuota avvia il percorso ricorsivo
        )
    )
)

(define lunghezza-calc              ; val:  intero positivo
    (lambda (s i)                   ; s:    lista,  i:  intero positivo
        (if
            (null? (cdr s)) i       ; se la parte restante escludendo il primo elemento della lista è vuota restituisci il valore numerico (contatore)
            (lunghezza-calc         ; se la parte restante escludendo il primo elemento della lista inizia la ricorsione passando:
                (cdr s)             ; la parte restante togliendo sempre il primo elemento
                (+ i 1)             ; il numero intero precedente sommando +1 (in funzione del contatore)
            )
        )
    )
)

(lunghezza '(1 2 3 4 5 6))          ; return 6
(length '(1 2 3 4 5 6))             ; return 6
 
