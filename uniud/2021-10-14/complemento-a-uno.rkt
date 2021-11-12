 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; -------------------------------------------------------------------------------

(define complemento
    (lambda (bin)
      (if (string=? (substring bin 0 1) "0") "1" "0")
    )
)

(define complemento-a-uno
    (lambda (bin)
        (if (> (string-length bin) 1)
            (string-append
               (complemento bin)
               (complemento-a-uno (substring bin 1))
            )
            (complemento bin)
        )
    )
)

(complemento-a-uno "11110000")      ; return "00001111"
(complemento-a-uno "10110")         ; return "01001"
 
