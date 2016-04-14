;; Add theme foled to path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Linenumbers
(global-linum-mode t)

;; Linumber style
(setq molokai-theme-kit t)

;; Load the molokai theme
(load-theme 'molokai t)

(provide 'appearance)
