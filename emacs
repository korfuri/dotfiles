;; Uriel Corfa's .emacs

;; Load stuff from .emacs.d
(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; If using common dotfiles, use the emacs.d there too
(if (file-exists-p "~/.dotfiles/emacs.d/site-lisp")
    (add-to-list 'load-path "~/.dotfiles/emacs.d/site-lisp"))

;; We're going to need lots of packages. Note that we set this up but we'll download them with use-package.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; This is from
;; http://cachestocaches.com/2015/8/getting-started-use-package/ and
;; installs use-package if it's not already present.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Try lets you try packages without installing them
(use-package try
  :ensure t)

;; Do not save Custom settings here. Use ~/.emacs.d/machine.emacs.el.
(setq custom-file "~/.emacs.d/machine.emacs.el")
(load custom-file)

;; Everything other than the bootstrapping and Custom's config should
;; go into separate files loaded below.

(use-package korfuri--misc)
(use-package korfuri--theme)
(use-package korfuri--windmove)
(use-package korfuri--ido)
(use-package korfuri--kill-ring-rotate)
(use-package korfuri--shell-command-on-region-in-place)
(use-package korfuri--fc-eval-and-replace)
(use-package korfuri--uniquify)
(use-package korfuri--tmux)
(use-package korfuri--kill-buffer-and-its-windows)
(use-package korfuri--flycheck)
(use-package korfuri--autocomplete)

;; Optional cool things, use them in your machine.emacs.el:
; (use-package korfuri--golang)
; (use-package korfuri--markdown)
; (use-package korfuri--python)

;; Machine-specific stuff is in .emacs.d/machine.emacs.el
;; This goes to the end of .emacs so machine.emacs.el can override
;; anything it wants.
(if (file-exists-p "~/.emacs.d/machine.emacs.el")
    (load-file "~/.emacs.d/machine.emacs.el"))
