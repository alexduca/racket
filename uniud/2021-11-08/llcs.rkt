
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; ----------------------------------------------------------------------------------------

; La funzione llcs serve a calcolare il numero di uguaglianze tra due stringhe

(define llcs            ; val: intero
    (lambda (a b)       ; a, b: stringhe
        (cond
            (
                (or (string=? a "") (string=? b ""))
                0
            )
            (
                (char=? (string-ref a 0) (string-ref b 0))
                (+
                    (llcs (substring a 1) (substring b 1))
                    1
                )
            )
            (else
                (max
                    (llcs (substring a 1) b)
                    (llcs a (substring b 1))
                )
            )
        )
    )
)

(llcs "AGACTGAACATAC" "GATCCGACTAC")      ; return 9 (G,A,T,G,A,C,T,A,C)
(llcs "ATRIO" "ARTO")                     ; return 3 (A,T,O) oppure (A,R,O)
 
