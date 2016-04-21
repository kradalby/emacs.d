
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; Turn off toolbar and scroll
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)


;; Set path to dependencies
(setq site-libs-dir
            (expand-file-name "libs" user-emacs-directory))

(setq settings-dir
            (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path site-libs-dir)
(add-to-list 'load-path settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-libs-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Set up appearance early
(require 'appearance)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)


;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     helm
     company
     popup
     neotree
     gist
     evil
     monokai-theme

     ;; Flycheck
     flycheck
     flycheck-tip
     flycheck-dialyzer

     ;; Auto-complete
     auto-complete
     jedi
     tern-auto-complete

     ;; Modes
     web-mode
     markdown-mode
     js2-mode
     less-css-mode
     gitattributes-mode
     gitconfig-mode
     gitignore-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
;; Stolen from https://github.com/magnars/.emacs.d
(require 'sane-defaults)

;; Key-bindings
(require 'key-bindings)

;; Auto-complete
(require 'autocomplete)

;; Flycheck
(require 'flycheck-config)


;; Language spesific
(require 'js2)
(require 'erlang)
(require 'web)

;; Initiate EVIL mode
;; (require 'evil)
;; (evil-mode 1)

;; Setup environment variables from the user's shell on Mac.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(package-selected-packages (quote (exec-path-from-shell markdown-mode magit flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
