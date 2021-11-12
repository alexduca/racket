 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 26 Ottobre 2021

; PROBLEMA:
; La procedura frase si applica a tre argomenti di tipo stringa che svolgono rispettivamente i ruoli di soggetto,
; predicato verbale e complemento oggetto. Soggetto e complemento oggetto sono rappresentati da sostantivi della
; lingua italiana; il predicato verbale dall’infinito di un verbo. La procedura restituisce una stringa che rappresenta una
; frase compiuta in italiano, dove i sostantivi sono preceduti da articoli determinativi appropriati e il verbo è declinato
; correttamente, come negli esempi riportati sotto. Per semplicità, considera solo sostantivi maschili che terminano con la
; lettera “o” al singolare, con la “i” al plurale e che possano essere preceduti dagli articoli “il” o “i”; considera solo
; sostantivi femminili che terminano con la lettera “a” al singolare, con la “e” al plurale e che possano essere preceduti
; dagli articoli “la” o “le”; considera inoltre solo verbi che, declinati alla terza persona dell’indicativo presente, hanno un
; comportamento regolare (-are → -a/-ano, -ere → -e/-ono, -ire → -e/-ono).
; Definisci la procedura frase in Scheme. Cerca di organizzare il programma introducendo opportune procedure di
; supporto che risolvono sottoproblemi specifici semplici, privilegiando la chiarezza (leggibilità) del codice.

; --------------------------------------------------------------------------------------------------------------------------------

(define soggetto
    (lambda (s)
        (let (
                (l (string-ref s (- (string-length s) 1) ))
            )
            (cond
                ((char=? l #\o) (string-append "Il " s))
                ((char=? l #\i) (string-append "I " s))
                ((char=? l #\a) (string-append "La " s))
                ((char=? l #\e) (string-append "Le " s))
            )
        )
    )
)

(define singolare?
    (lambda (s)
        (let (
                (l (string-ref s (- (string-length s) 1) ))
            )
            (cond
                ((char=? l #\o) 1)
                ((char=? l #\i) 0)
                ((char=? l #\a) 1)
                ((char=? l #\e) 0)
            )
        )
    )
)

(define predicato-verbale
    (lambda (s v)
        (let (
                (mtd (singolare? s))
                (pre (substring v 0 (-(string-length v)3) ))
                (con (substring v (-(string-length v)3) ))
            )
            (cond
                ((string=? con "are") (if (= mtd 1) (string-append pre "a") (string-append pre "ano")))
                ((string=? con "ere") (if (= mtd 1) (string-append pre "e") (string-append pre "ono")))
                ((string=? con "ire") (if (= mtd 1) (string-append pre "i") (string-append pre "ono")))
            )        
        )
    )
)

(define complemento
    (lambda (c)
        (let (
                (i (string-ref c (- (string-length c) 1) ))
            )
            (cond
                ((char=? i #\o) (string-append "il " c "."))
                ((char=? i #\i) (string-append "i " c "."))
                ((char=? i #\a) (string-append "la " c "."))
                ((char=? i #\e) (string-append "le " c "."))
            )
        )
    )
)

(define frase
    (lambda (s p c)
        (string-append
            (soggetto s)
            " "
            (predicato-verbale s p)
            " "
            (complemento c)
        )
    )
)

(frase "gatto" "cacciare" "topi")             ; return "Il gatto caccia i topi."
(frase "mucca" "mangiare" "fieno")            ; return "La mucca mangia il fieno."
(frase "sorelle" "leggere" "novella")         ; return "Le sorelle leggono la novella."
(frase "bambini" "amare" "favole")            ; return "I bambini amano le favole."
(frase "musicisti" "suonare" "pianoforti")    ; return "I musicisti suonano i pianoforti."
(frase "cuoco" "friggere" "patate")           ; return "Il cuoco frigge le patate."
(frase "camerieri" "servire" "clienti")       ; return "I camerieri servono i clienti."
(frase "mamma" "chiamare" "figlie")           ; return "La mamma chiama le figlie."
 
