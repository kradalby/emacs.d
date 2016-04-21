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

;; Erlang Emacs Mode -- Configuration Start
(setq erlang-root-dir "/usr/local/Cellar/erlang/18.3/lib/erlang")
(setq load-path (cons "/usr/local/Cellar/erlang/18.3/lib/erlang/lib/tools-2.8.3/emacs" load-path))
(setq exec-path (cons "/usr/local/Cellar/erlang/18.3/lib/erlang/bin" exec-path))
(require 'erlang-start)
;; Erlang Emacs Mode -- Configuration End

(provide 'erlang)
