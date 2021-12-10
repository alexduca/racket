 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 7 Dicembre 2021

; ------------------------------------------------------------------------------------------------------------------------------------------

; Per “Cifrario di Cesare” oggi si intende una semplice regola crittografica di sostituzione che “ruota” ciascuna lettera
; del testo in chiaro di un numero prefissato di posizioni nell’ordine alfabetico. L’entità della rotazione, detta anche
; “chiave” di decodifica, è concordata fra il mittente e il destinatario del messaggio. Stando ai resoconti di Svetonio,
; Giulio Cesare avrebbe utilizzato questo rudimentale sistema di crittazione con chiave 3. 
; Per esempio, tenuto conto che le lettere dell’alfabeto Latino dell’epoca erano: A B C D E F G H I L M N O P Q R S T V X , La frase
;       ALEA IACTA EST IVLIVS CAESAR DIXIT
; sarebbe stata trasformata nel messaggio cifrato
;       DOHD NDFAD HXA NBONBX FDHXDV GNCNA
; A differenza del testo riportato sopra in una forma che ne facilita la lettura, il messaggio crittato non contiene spazi
; bianchi per separare le parole, ma è costituito da una sequenza ininterrotta di lettere. Basandoti sul modello sviluppato a
; lezione, definisci una procedura con valori procedurali che, data una chiave compresa nell’intervallo [0, 19], restituisce
; la corrispondente funzione di crittazione, da lettera maiuscola a lettera maiuscola, per l’alfabeto Latino dell’epoca
; Repubblicana. (Suggerimento: l’alfabeto Latino può essere codificato tramite una stringa oppure una lista di caratteri.)

(define crittazione                     ; val: stringa
    (lambda (msg reg)                   ; msg: stringa      reg: procedura [lett] -> [lett]
        (if
            (string=? msg "")
            ""
            (let
                (
                    (spc (reg (string-ref msg 0)))
                )
                (string-append
                    (if
                        (= spc 32)
                        (string #\space)    ; ""    ; Per mettere o togliere gli spazi tra una parola e l'altra modificare questa riga
                        (string (carattere (reg (string-ref msg 0))) )
                    )
                    (crittazione (substring msg 1) reg)
                )
            )
        )
    )
)

; Definisce l'Alfabeto Latino composto da 20 caratteri
(define alfabeto "ABCDEFGHILMNOPQRSTVX")

; Definisce il valore numerico dell'ultima cifra dell'Alfabeto latino
(define posEnd (- (string-length alfabeto) 1) )

; Restituisce la posizione del carattere nel Alfabeto Latino
(define posizione
    (lambda (c n)
        (if 
            (<= n 19)
            (if
                (char=? c (string-ref alfabeto n))
                n   ; posizione carattere
                (posizione c (+ n 1))
            )
            32
        )
    )
)

(define carattere
    (lambda (n)
        (string-ref alfabeto n)
    )
)

(define cifrario-cesare
    (lambda (rot)
        (if 
            (and                        ; verifica se la "chiave" è compresa tra 0 e 19
                (>= rot 0)
                (<= rot posEnd)
            )
            (lambda (x)                 ; se è compresa procedi con la crittazione
                    (let
                        (               ; r: posizione effettiva del carattere
                            (r (char->integer x))
                            (i (+ rot (posizione x 0))) 
                        )               ; i: posizione del carattere da maiuscolo a minuscolo
                        (if (= r 32)
                            32
                            (if
                                (<= i posEnd)
                                i
                                (- i 20)
                            )
                        )
                    )
            )
            (lambda (x) x)              ; se non è compresa ritorna il messaggio come l'ha ricevuto
        )
    )
)

(crittazione "ALEA IACTA EST IVLIVS CAESAR DIXIT" (cifrario-cesare 3))
 
