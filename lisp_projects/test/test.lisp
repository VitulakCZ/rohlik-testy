#!/usr/bin/sbcl --script
(defvar rohliky)
(defvar penize)

(defun pocty (zmena_penez)
  (if (not zmena_penez)
    (tagbody input_rohliku
      (format t "Kolik rohlíků? ")
      (finish-output)
      (setq rohliky (read))
      (if (not (numberp rohliky))
        (progn
          (write-line "Jsi kokot!")
          (go input_rohliku)))))
    (tagbody input_penez
      (format t "Kolik zaplatíš? ")
      (finish-output)
      (setq penize (read))
      (if (not (numberp penize))
        (progn
          (write-line "Jsi kokot!")
          (go input_penez)))))
(pocty NIL)
(loop while (< penize (* rohliky 3)) do
  (let (vyber)
    (format t "To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ")
    (finish-output)
    (setq vyber (read))
    (if (string-equal vyber "Z")
      (pocty NIL))
    (if (string-equal vyber "C")
      (pocty T))
    (if (string-equal vyber "E")
      (quit))))
