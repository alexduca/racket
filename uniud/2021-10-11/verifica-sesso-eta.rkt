 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca
; Esercizio svolto in autonomia per esercitarsi con racket

; -------------------------------------------------------------------------------

; Realizzo una o più funzioni che restituiscano "maschio" o "femmina"
(define sesso
    (lambda (name)
        (char=?
            (string-ref name (- (string-length name) 1))
            #\a
        )
    )
)
(define verifica-sesso
      (lambda (name)
          (if (sesso name) "femmina" "maschio")
      )
)
(verifica-sesso "Marco")
(verifica-sesso "Francesca")

; -------------------------------------------------------------------------------

; Realizzo una o più funzioni che restituiscano "maggiorenne" o "minorenne"
(define eta
    (lambda (n)
        (>= n 18)
    )
)
(define verifica-eta
    (lambda (n)
        (if (eta n) "maggiorenne" "minorenne")
    )
)
(verifica-eta 21)
(verifica-eta 17)
 
