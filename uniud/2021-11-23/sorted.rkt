 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 23 Novembre 2021

; --------------------------------------------------------------------------------------------------------------------------------------------

; In questi esercizi ti viene richiesto di lavorare con sequenze ordinate di numeri interi, rappresentate attraverso le liste.
; Per operare sulle liste utilizza esclusivamente la costante null e le primitive di base: null?, car, cdr, cons.

; Innanzitutto, definisci in Scheme una procedura belong? che, dati un intero x e una lista ordinata S, verifica se x è un elemento di S.

(define belong?         ; val:  true / false
    (lambda (n ls)      ; n: intero - ls: lista
        (if
            (null? ls)
            #false
            (let
                (
                    (el (car ls))
                    (rs (cdr ls))
                )
                (if (= n el)
                    #true
                    (belong? n rs)
                )  
            )         
        )
    )
)

(belong? 18 '())                ; return #false
(belong? 18 '(5 7 10 18 23))    ; return #true
(belong? 18 '(5 7 10 12 23))    ; return #false

; --------------------------------------------------------------------------------------------------------------------------------------------

; Successivamente, definisci in Scheme una procedura position che, dati un intero x e una lista ordinata e senza
; ripetizioni S, restituisce la posizione (indice) di x in S.

(define position            ; val: intero positivo
    (lambda (n ls)          ; n: intero positivo - ls: lista
        (if
            (null? ls)
            "empty"
            (position-calc n ls 0)        
        )   
    )
)
(define position-calc       ; val: intero positivo >= 0
    (lambda (n ls ct)       ; s: lista - i: intero positivo - ct: intero positivo
        (if 
            (null? ls)
            "null"
            (let
                (
                    (el (car ls))
                    (rs (cdr ls))
                )
                (if (= n el)
                    ct
                    (position-calc n rs (+ ct 1))
                )          
            )
        )
    )
)

(position 7 '(7 8 24 35 41))        ; return 0
(position 35 '(7 8 24 35 41))       ; return 3
(position 41 '(7 8 24 35 41))       ; return 4
(position 5 '(1 2 3 4 6 7 8))       ; return "null"
(position 23 '())                   ; return "empty"

; Ho aggiunto un controllo sulle liste vuote inizialmente e se l'elemento N non esiste nella lista LS

; --------------------------------------------------------------------------------------------------------------------------------------------

; Definisci quindi una procedura sorted-ins che, dati un intero x e una lista ordinata e senza ripetizioni S, restituisce
; la lista ordinata e senza ripetizioni che contine x e tutti gli elementi di S.

(define sorted-ins
    (lambda (n ls)
        (if
            (null? ls)
            (cons n ls)
            (cond
                (
                    (> n (car ls))
                    (cons (car ls) (sorted-ins n (cdr ls)))
                )
                (
                    (= n (car ls))
                    (cons n (cdr ls))
                )
                (else (cons n ls))
            )
        )
    )
)

(sorted-ins 24 '())                     ; return '(24)
(sorted-ins 5 '(7 8 24 35 41))          ; return '(5 7 8 24 35 41)
(sorted-ins 24 '(7 8 24 35 41))         ; return '(7 8 24 35 41)
(sorted-ins 27 '(7 8 24 35 41))         ; return '(7 8 24 27 35 41)

; --------------------------------------------------------------------------------------------------------------------------------------------

; Infine, applica sorted-ins per definire una procedura sorted-list che, data una lista senza ripetizioni S,
; restituisce la lista ordinata e senza ripetizioni S' che contine tutti e soli gli elementi di S.

(define sorted-list
    (lambda (ls)
        (if
            (null? (cdr ls))
            ls
            (sorted-ins (car ls) (sorted-list (cdr ls)))
        )
    )
)
(sorted-list '(35 8 41 24 7))           ; return '(7 8 24 35 41)
(sorted-list '(4 6 1 2 5 3))            ; return '(1 2 3 4 5 6)
 
