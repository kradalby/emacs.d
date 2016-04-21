;; Erlang
(require 'flycheck-dialyzer)
(add-hook 'erlang-mode-hook 'flycheck-mode)

;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "/usr/local/Cellar/erlang/18.3/lib/erlang/lib/eqc-1.37.2/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/usr/local/Cellar/erlang/18.3/lib/erlang/lib/eqc-1.37.2")
;; EQC Emacs Mode -- Configuration End

;; Erlang
(setq erlang-root-dir "/usr/local/Cellar/erlang/18.3/lib/erlang")
(setq load-path (cons "/usr/local/Cellar/erlang/18.3/lib/erlang/lib/tools-2.8.3/emacs" load-path))
(setq exec-path (cons "/usr/local/Cellar/erlang/18.3/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.[eh]rl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.escript?\\'" . erlang-mode))

;; distel
(push "~/.emacs.d/libs/distel/elisp/" load-path)
(require 'distel)
(distel-setup)

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol "emacs@localhost"))

;; company-distel
(require 'auto-complete-distel)
(add-hook 'erlang-mode-hook '(lambda () (add-to-list 'ac-sources 'distel-completions)))
(setq distel-completion-get-doc-from-internet t)

(provide 'erlang)
