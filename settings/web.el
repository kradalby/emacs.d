;; Derive some more modes

(define-derived-mode js-web-mode web-mode "JavaScript web-mode"
                     "JavaScript mode from Web mode, only for linter")

(define-derived-mode json-web-mode web-mode "JSON web-mode"
                     "JavaScript mode from Web mode, only for linter")

(define-derived-mode css-web-mode web-mode "CSS web-mode"
                     "CSS mode from Web mode, only for linter")

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
(add-to-list 'auto-mode-alist '("\\.jsx$" . js-web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-web-mode))

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

;; Linting
(with-eval-after-load 'flycheck
                      (flycheck-add-mode 'html-tidy 'web-mode)
                      (flycheck-add-mode 'javascript-eslint 'js-web-mode)
                      (flycheck-add-mode 'json-jsonlint 'json-web-mode)
                      )

;; Load tern javascript engine
(require 'tern)
(add-hook 'js-web-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
                 '(progn
                    (require 'tern-auto-complete)
                    (tern-ac-setup)))

(provide 'web)
