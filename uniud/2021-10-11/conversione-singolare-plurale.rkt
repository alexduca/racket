 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca
; Esercizio svolto in autonomia per esercitarsi con racket

; -------------------------------------------------------------------------------

(define femminile?
    (lambda (p)
        (string=? (substring p ( - (string-length p) 1)) "a")
    )
)

(define sf-plurale
    (lambda (sf)
        (string-append (substring sf 0 ( - (string-length sf) 1)) "e")
    )
)

(define sm-plurale
    (lambda (sm)
        (string-append (substring sm 0 ( - (string-length sm) 1)) "i")
    )
)
     
(define plurale
    (lambda (s)
        (if (femminile? s) (sf-plurale s) (sm-plurale s))
    )
)

(plurale "benvenuto")       ; return "benvenuti"
(plurale "racchetta")       ; return "racchette"
 
