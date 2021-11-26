 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 19 Novembre 2021

; ---------------------------------------------------------------------------------------------------------------------

; Ci proponiamo di generalizzare il problema dei percorsi di Manhattan e di risolverlo in uno spazio tridimensionale. È
; dunque dato un reticolo come quello schematizzato nella figura, che si può pensare costituito da un sistema di corridoi
; che si sviluppano sui diversi piani di un edificio, inclusi gli ascensori o le scale che collegano piani diversi, dove le
; stanze occupano i “cubetti” delimitati dai corridoi. In quanti modi diversi ci si può spostare dal punto A al punto B,
; senza allungare inutilmente il percorso, quando A e B denotano due incroci di corridoi che distano i piani, j stanze in
; direzione est-ovest e k stanze in direzione nord-sud?

; -----------------------------------------------------------------------------------------------------------------------------------

; Definisci in Scheme una procedura manhattan-3d che, dati tre interi non negativi i, j e k, restituisca il numero di
; percorsi diversi di lunghezza minima attraverso un reticolo tridimensionale fra punti che distano i, j e k unità lungo le
; tre direzioni (perpendicolari fra di loro) dei collegamenti.

(define manhattan-3d
    (lambda (i j k)
        (cond
            ( (= i 0) (paths2d j k) )
            ( (= j 0) (paths2d i k) )
            ( (= k 0) (paths2d i j) )
            (else (+ (manhattan-3d (- i 1) j k) (+ (manhattan-3d i (- j 1) k) (manhattan-3d i j (- k 1)))))
        )
    )
)

(define paths2d
    (lambda (a b)
        (if
            (or (= a 0) (= b 0))
            1
            (+ (paths2d a (- b 1)) (paths2d (- a 1) b))
        )
    )
)

(manhattan-3d 0 0 7)      ; return 1    
(manhattan-3d 2 0 2)      ; return 6
(manhattan-3d 1 1 1)      ; return 6
(manhattan-3d 1 1 5)      ; return 42
(manhattan-3d 2 3 1)      ; return 60
(manhattan-3d 2 3 3)      ; return 560
 
