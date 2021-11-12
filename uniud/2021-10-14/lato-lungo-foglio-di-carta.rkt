 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; ----------------------------------------------------------------------------------------------------

; Realizziamo un programma che calcoli la lunghezza del lato piu lungo dei fogli di carta A3-A4-...

(define lun       ; val: reale
    (lambda (k)     ; k:   intero non negativo
        (if (> k 1)
        (/ (lun (- k 2)) 2)
              (if (= k 0) lun0 lun1)
        )
    )
)

(define lun0
    (* 100 (expt 2 1/4))
)

(define lun1
    (* 100 (expt 2 -1/4))
)

; lun1 / lun0 = lun0 / 2xlun1
; lun0 x lun1 = 10000cm.quad

; (lun $f)    $f = formato del foglio (A3: 3, A4: 4, A5: 5)
(lun 2)       ; return #i59.46035575013605
(lun 3)       ; return #i42.044820762685724
(lun 4)       ; return #i29.730177875068026
(lun 5)       ; return #i21.022410381342862
 
