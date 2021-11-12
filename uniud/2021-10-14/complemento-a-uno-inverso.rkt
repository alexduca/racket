 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; -------------------------------------------------------------------------------

(define complemento-inverso
    (lambda (bin)
        (if (string=? (substring bin (- (string-length bin) 1)) "0") "1" "0")
    )
)

(define complemento-uno-inverso
    (lambda (bin)
        (if (> (string-length bin) 1)
            (string-append
                (complemento-uno-inverso (substring bin 0 (- (string-length bin) 1)))
                (complemento-inverso bin)
            )
            (complemento-inverso bin)
        )
    )
)

(complemento-uno-inverso "10101110101110101010")    ; return "01010001010001010101"
 
