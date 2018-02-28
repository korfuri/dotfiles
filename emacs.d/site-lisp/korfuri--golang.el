;;; package -- summary

;;; Commentary:
;; This file will only work if $GOPATH is defined.  Remember to
;; install Go first.  You'll also need the following:
;; * export GOPATH in your bashrc
;; * export PATH="$PATH:$GOPATH/bin"` in your bashrc
;; * `go get -u github.com/dougm/goflymake` for flycheck
;; * `go get -u github.com/nsf/gocode` for company & eldoc
;; * `go get -u github.com/rogpeppe/godef` for godef
;; * `go get -u github.com/kisielk/errcheck` for errcheck
;; * `go get   golang.org/x/tools/cmd/guru` for guru

;;; Code:

(use-package go-mode
  :ensure t)

;; Flycheck
(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")

(use-package go-flycheck)

;; Company
(add-to-list 'load-path "$GOPATH/src/github.com/nsf/gocode/emacs-company")

(use-package company-go
  :ensure t)

(add-hook
 'go-mode-hook
 (lambda ()
   (set (make-local-variable 'company-backends) '(company-go))
   (company-mode)))

;; Eldoc
(use-package go-eldoc
  :ensure t
  :init (add-hook 'go-mode-hook 'go-eldoc-setup))

;; Errcheck
(use-package go-errcheck)

;; Guru
;; Guru finds references to a symbol (while godef finds the definition of a symbol)
(use-package go-guru
  :ensure t
  :init (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))

;; Go mode hydra
(define-key
  go-mode-map (kbd "C-c .")
  (defhydra hydra-golang
    (go-mode-map "C-c .")
    "Golang"
    ("a" beginning-of-defun "beginning-of-defun")
    ("e" end-of-defun "end-of-defun")
    ("j" godef-jump-other-window "godef-jump-other-window")
    ("J" godef-jump "godef-jump")
    ("D" godef-describe "godef-describe")
    ("i a" go-import-add "import-add")
    ("i r" go-remove-unused-imports "remove-unused-imports")
    ("i j" go-goto-imports "jump-to-imports")
    ("f" gofmt "gofmt")
    ("d" godoc "godoc-at-point")
    ("r" go-errcheck "errcheck")
    ("q" nil "quit")))

;; Gotest runs Go tests directly from Emacs
(use-package gotest
  :ensure t)

(provide 'korfuri--golang)
;;; korfuri--golang ends here
