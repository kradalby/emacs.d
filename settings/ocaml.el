

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp/"))
(load (concat opam-share "/emacs/site-lisp/tuareg-site-file"))

;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;;(with-eval-after-load 'merlin
;;  ;; Disable Merlin's own error checking
;;  (setq merlin-error-after-save nil)
;;
;;  ;; Enable Flycheck checker
;;  (flycheck-ocaml-setup))


(provide 'el)
