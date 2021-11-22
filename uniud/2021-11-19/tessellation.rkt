 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 19 Novembre 2021

; ---------------------------------------------------------------------------------------------------------------------

;   L-tile
;   (shift-down <figura> <passi>)
;   (shift-right <figura> <passi>)
;   (quarter-turn-right <figura>)
;   (quarter-turn-left <figura>)
;   (half-turn <figura>)
;   (glue-tiles <figura> <figura>)

(set-tessellation-shift-step!)

(define tass-build
  (lambda (ob n)
    (glue-tiles
      (shift-down (quarter-turn-left ob) n)
      (glue-tiles
        (glue-tiles
           ob
           (shift-right (shift-down ob (/ n 2)) (/ n 2))
         )
        (shift-right (quarter-turn-right ob) n)
      )
    )
  )
)

(define tass-manager
  (lambda (ob n r)
    (cond
      ((= n r) ob)
      (else (tass-manager (tass-build ob (* n 2)) (* n 2) r))
    )
  ))

(define tassellation
  (lambda (n)
    (tass-manager L-tile 1 n)
  )
)

(tassellation 1)
(tassellation 2)
(tassellation 4)
(tassellation 8)
(tassellation 16)
 
