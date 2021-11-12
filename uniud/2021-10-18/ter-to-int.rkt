 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; ---------------------------------------------------------------------------------

(define ter-to-int          ; val: intero
    (lambda (btr)           ; btr: string di -/./+
        (let (
            (k (- (string-length btr) 1)
        ))
        (if (= k 0)
            (int (string-ref btr k))
            (+ (* 3 (ter-to-int (substring btr 0 k))) (int (string-ref btr k)))
        ))
    )
)

(define int                 ; val: intero -1, 0, +1
    (lambda (btd)           ; btd: carattere -/./+
        (cond
            ((char=? btd #\-) -1)
            ((char=? btd #\.) 0)
            ((char=? btd #\+) +1)
        )
    )
)

(ter-to-int "++-.+")        ; return 100
(ter-to-int "++..-+-")      ; return 965
(ter-to-int "-+--+.++")     ; return -1751
 
