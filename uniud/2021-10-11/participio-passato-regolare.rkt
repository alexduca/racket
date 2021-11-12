 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; -------------------------------------------------------------------------------

(define part-pass-13
    (lambda (inf)
        (string-append (substring inf 0 (- (string-length inf) 2)) "to")
    )
)

(define part-pass-2
    (lambda (inf)
        (string-append (substring inf 0 (- (string-length inf) 3)) "uto")
    )
)
(define 2a-coniug?
    (lambda (s)
        (char=? (string-ref s (-(string-length s) 3)) #\e)
    )
)

(define partpass
    (lambda (vr)
        ( if (2a-coniug? vr) (part-pass-2 vr) (part-pass-13 vr) )
    )
)
  
(partpass "cantare")      ; return "cantato"
(partpass "cadere")       ; return "caduto"
(partpass "dormire")      ; return "dormito"
 
