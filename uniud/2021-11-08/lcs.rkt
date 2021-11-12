 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; -------------------------------------------------------------------------------------------

; La funzione lcs serve restituisce una stringa contenente le uguaglianze tra due stringhe

(define lcs             ; val: stringa
    (lambda (a b)       ; a, b: stringhe
        (cond
            (
                (or (string=? a "") (string=? b ""))
                ""
            )
            (
                (char=? (string-ref a 0) (string-ref b 0))
                (string-append
                    (substring b 0 1)
                    (lcs (substring a 1) (substring b 1))
                )
            )
            (else
                (longer (lcs (substring a 1) b) (lcs a (substring b 1)) )
            )
        )
    )
)
(define longer          ; val: string
    (lambda (a b)       ; a, b: stringhe
        (let
            (
                (a-len (string-length a))
                (b-len (string-length b))
            )
            (cond
                ((< a-len b-len) b)
                ((> a-len b-len) a)
                ((= (random 2) 0) b)
                (else a)
            )
        )
    )
)

(lcs "AGACTGAACATAC" "GATCCGACTAC")     ; return "GATGACTAC"
(lcs "ATRIO" "ARTO")                    ; return "ATO" or "ARO"
 
