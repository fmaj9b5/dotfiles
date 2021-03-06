;;;;; PACKAGE MANAGEMENT ;;;;;

(require 'package)

(add-to-list 'package-archives
  '("org" . "http://orgmode.org/elpa/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (yaml-mode frames-only-mode solarized-theme solaized-theme neotree company-mode intero helm markdown-mode use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq package-enable-at-startup nil)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package frames-only-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package company
  :ensure t)
(use-package helm
  :ensure t)
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :ensure t)
(use-package intero
  :ensure t)
(use-package neotree
  :init
    (global-set-key [f8] 'neotree-toggle)
  :ensure t)
(use-package solarized-theme
  :ensure t)

;;;;; LOADING PACKAGES ;;;;;

(add-hook 'haskell-mode-hook 'intero-mode)
(load "/home/b11b9/.opam/system/share/emacs/site-lisp/tuareg-site-file")
(evil-mode t)

(push "/home/tsani/.opam/system/share/emacs/site-lisp" load-path)
(autoload 'merlin-mode "merlin" nil t nil)
(add-hook 'tuareg-mode-hook 'merlin-mode t)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))
(add-hook 'merlin-mode-hook 'company-mode)

(helm-mode 1)
(frames-only-mode 1)

;;;;; KEYBINDINGS ;;;;;

(define-key evil-normal-state-map (kbd ", w") 'save-buffer)
(define-key evil-normal-state-map (kbd ", q") 'evil-quit)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;;;;; TEXT MODE ;;;;;
; Options that influence the writing of text.

(add-hook 'text-mode-hook
	  '(lambda ()
	     (set-fill-column 80)
	     (turn-on-auto-fill)))

; make insert-mode C-u delete to beginning of line
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(setq-default
  indent-tabs-mode nil
  tab-width 2)
(setq indent-line-function 'insert-tab)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;;;;; INTEGRATIONS ;;;;;

(setq vc-follow-symlinks t)
(setq x-select-enable-primary t)

;;;;; VISUALS ;;;;;

(load-theme 'solarized-light)
(setq show-paren-delay 0)
(show-paren-mode 1)
(set-default-font "Envy Code R-10")
(add-to-list 'default-frame-alist
             '(font . "Envy Code R-10"))
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
