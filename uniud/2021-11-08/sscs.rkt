 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca
; Esercizio svolto in autonomia per esercitarsi con racket

; ------------------------------------------------------------------------------------------------------------------------------

; Esercizio: abbiamo due stringhe e vogliamo conoscere il numero di differenze minimo tra le due stringhe
; ogni carattere che viene perso tra le due stringhe viene contato e più sarà grande il numero peggiore sarà il risultato

; Logica: Prendere la stringa più lunga tra le due e sottrare il numero ottenuto dalla funzione "llcs" precedente realizzata
; La funzione "llcs" (rinominata in "llcs-rec") fa l'operazione inversa: calcola il numero di uguaglianze tra le due stringhe

; ------------------------------------------------------------------------------------------------------------------------------

(define llcs-rec        ; val: intero
    (lambda (a b)       ; a, b: stringhe    
        (cond
            (
                (or (string=? a "") (string=? b ""))
                0
            )
            (
                (char=? (string-ref a 0) (string-ref b 0))
                (+
                    (llcs-rec (substring a 1) (substring b 1))
                    1
                )
            )
            (else
                (max
                    (llcs-rec (substring a 1) b)
                    (llcs-rec a (substring b 1))
                )
            )
        )
    )
)

(define sscs          ; val:  intero
    (lambda (a b)     ; a, b: stringhe
        (let
            (
                (llcs (llcs-rec a b))
                (len-a (string-length a))
                (len-b (string-length b))
            )
            (cond
                (
                    (= len-a 0) 0
                )
                (
                    (> len-a len-b)
                    (- len-a llcs)
                )
                (
                    (< len-a len-b)
                    (- len-b llcs)
                )
                ( else
                    (- len-a llcs)
                )
            )
        )
    )
)

(sscs "ABCDE" "ACD")        ; return 2 (B,E)
(sscs "FAFFAG" "FF")        ; return 4 (A,F,A,G)
(sscs "GADGET" "GET")       ; return 3 (A,D,G)
(sscs "" "A")               ; return 0 (a vuoto)
(sscs "A" "ABC")            ; return 2 (B,C)
 
