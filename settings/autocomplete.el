
;; Initiate auto-complete
(ac-config-default)

;; Load tern javascript engine
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(provide 'autocomplete)

