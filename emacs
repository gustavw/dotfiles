;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode t)  ;; Line numbers
(menu-bar-mode 1)
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 
(global-hl-line-mode 1)  ;; Cursor line

(setq-default indent-tabs-mode nil)
; Somewhat better formatting when showing line numbers, but still...
(setq linum-format "%d ")

; hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; turn off autosave and backup files
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Show matching parens
(show-paren-mode 1)


(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (exec-path-from-shell jedi elpy button projectile lsp-mode emacs-lsp whitespace-mode airline-themes airline-theme powerline-evil solarized-theme markdown-mode use-package helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; Use vil mode
;;(require 'evil)
;;(evil-mode t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; More configuration goes here
  )

(use-package exec-path-from-shell
  :ensure t)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(use-package markdown-mode
  :ensure t)

(use-package solarized-theme
  :ensure t
  :init
  (progn
    (load-theme 'solarized-dark)))

;; Powerline
(use-package airline-themes :ensure t)
(use-package powerline
  :ensure t
  :config ( progn
    (require 'airline-themes)
    (load-theme 'airline-dark)
  )
)

;; Fuzzy search
(use-package helm
  :ensure t)

;; White-space mode
(use-package whitespace
  :config (progn
    (whitespace-mode)
    (setq whitespace-line-column nil)
  )
  :diminish whitespace-mode)

;; Deoendncies for LSP
(use-package projectile
  :ensure t)
(use-package cl-lib
  :ensure t)
;(use-package button
;  :ensure t)
(use-package json
  :ensure t)

;; Config python dev
;(use-package python-environment
;  :ensure t
;  :config(progn
;    (setq python-environment-bin "/usr/local/bin")))

(setq python-shell-interpreter "ipython3")
(setq python-shell-interpreter-args "--simple-prompt -i")
(use-package jedi
  :ensure t
  :config(progn
           (add-hook 'python-mode-hook 'jedi:setup)
           (setq jedi:complete-on-dot t)
           (setq py-python-command "/usr/local/bin/python3")
           ))

(use-package elpy
  :ensure t
  :config
  (progn
    (setq elpy-rpc-python-command "/usr/local/bin/python3")
    ;(setq elpy-modules '(elpy-module-sane-defaults
    ;                     elpy-module-company
    ;                     elpy-module-eldoc
    ;                     elpy-module-pyvenv))
    (elpy-enable))
    ;(elpy-use-ipython)
  )

;; Manual packages
;(load-file "~/.emacs.d/lisp/lsp-mode.el")
