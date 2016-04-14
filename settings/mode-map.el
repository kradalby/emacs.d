;; Global
(add-hook 'after-init-hook #'global-flycheck-mode)

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


;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;; Erlang
(require 'flycheck-dialyzer)
(add-hook 'erlang-mode-hook 'flycheck-mode)

(provide 'mode-map)
