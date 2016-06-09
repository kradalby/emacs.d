

;; Web-Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Grey22")

;; JSX
(defadvice web-mode-highlight-part (around tweak-jsx activate)
           (if (equal web-mode-content-type "jsx")
             (let ((web-mode-enable-part-face nil))
               ad-do-it)
             ad-do-it))

(with-eval-after-load 'flycheck
                      (flycheck-add-mode 'html-tidy 'web-mode)
                      (flycheck-add-mode 'javascript-eslint 'web-mode)
                      )

;;(flycheck-define-checker jsx-checker
;;                         "A JSX syntax and style checker based on ESlint."
;;
;;                         :command ("eslint" source)
;;                         :error-patterns
;;                         ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;                         :modes (web-mode))
;;
;;(add-hook 'web-mode-hook
;;          (lambda ()
;;            (when (equal web-mode-content-type "jsx")
;;              ;; enable flycheck
;;              (flycheck-select-checker 'jsx-checker)
;;              (flycheck-mode))))

(provide 'web)
