 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca
; Esercizio svolto in autonomia per esercitarsi con racket

; ------------------------------------------------------------------------------------------------

; VOLUME SFERA
; Realizzo una funzione che calcoli il volume di una sfera tramite il raggio 

(define volume-sfera
    (lambda (r)
        (/ (* (* (expt r 3) pi) 4) 3)
    )
)
(volume-sfera 2.5)     ; return 65.44       (volume sfera con raggio 2.5)
(volume-sfera 11.8)    ; return 6882.31     (volume sfera con raggio 11.8)

; ------------------------------------------------------------------------------------------------

; VOLUME PIRAMIDE
; Realizzo una funzione che calcoli il volume di una piramide tramite: lato A, lato B, altezza

(define volume-piramide
    (lambda (a b h)
        (/ (* (* a b) h) 3)
    )
)
; $latoA $latoB $altezza
(volume-piramide 3 4 5)     ; return 20
(volume-piramide 6 8 12)    ; return 192
 
