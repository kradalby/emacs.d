;; Add theme foled to path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Font
(set-default-font "Monaco 10")

;; Linenumbers
(global-linum-mode t)

;; Linumber style
(setq molokai-theme-kit t)

;; Load the molokai theme
(load-theme 'molokai t)

;; Don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

(provide 'appearance)
