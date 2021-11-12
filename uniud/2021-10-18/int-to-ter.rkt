 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca

; -------------------------------------------------------------------------------

; n = 3 * q + r                     quando      r = -1, 0, +1
; n = 3 * q + r = 3 * (q-1) + r+3   se          r = -2  ---  r+3 = +1
; n = 3 * q + r = 3 * (q+1) + r-3   se          r = +2  ---  r-3 = -1

(define int-to-ter              ; val: string +/-/.
    (lambda (n)                 ; val: integer
        (let
            (
                (q (quotient n 3))
                (r (remainder n 3))
            )
            (cond
                ((<= (abs n) 1) (ter n))
                ((= r -2) (string-append (int-to-ter (- q 1)) (ter +1)))
                ((= r +2) (string-append (int-to-ter (+ q 1)) (ter -1)))
                ( else (string-append (int-to-ter q) (ter r)) )
            )  
        )
    )
)

(define ter                     ; val: string
    (lambda (x)                 ; val: integer (1, 0, -1)
        (cond
            ((= x -1) "-")
            ((= x 0) ".")
            ((= x +1) "+")
        )
    )
)

(int-to-ter 100)                ; return "++-.+"
(int-to-ter -1751)              ; return "-+--+.++"
(int-to-ter 965)                ; return "++..-+-"
 
