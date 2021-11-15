 
; UNIVERSITÀ DEGLI STUDI DI UDINE - Alex Duca   //  Laboratorio - 26 Ottobre 2021

; ---------------------------------------------------------------------------------------------------------------------

;; Per eseguire questo codice e' necessario
;; utilizzare il TeachPack "drawings.ss"
;; https://users.dimi.uniud.it/~claudio.mirolo/teaching/programmazione/pages/examples/teachpack/drawings.ss

;;   larger-tile
;;   smaller-tile

;;   (shift-down <forma> <passi>)
;;   (shift-right <forma> <passi>)
;;   (quarter-turn-right <forma>)
;;   (quarter-turn-left <forma>)
;;   (half-turn <forma>)
;;   (glue-tiles <forma> <forma>)

;; L'obiettivo e' di costruire una croce regolare e un quadrato
;; con il minimo numero di pezzi, corrispondenti alle forme base,
;; opportunamente posizionati e orientati.

; ---------------------------------------------------------------------------------------------------------------------

(set-puzzle-shift-step!)

; CROCE
(glue-tiles
   (glue-tiles
      (glue-tiles
         (shift-right smaller-tile 2) larger-tile)
         (shift-down (shift-right (half-turn larger-tile) 2) 1)
      )
   (shift-down (shift-right (half-turn smaller-tile) 2) 5)
)

; QUADRATO
(shift-down (glue-tiles
  (glue-tiles
     smaller-tile
     (shift-down (half-turn smaller-tile) 0)
  )
  (shift-down (glue-tiles
     smaller-tile
     (shift-down (half-turn smaller-tile) 0)
  ) 1)
) 1)
 
