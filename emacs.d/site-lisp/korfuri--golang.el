;;; package -- summary

;;; Commentary:
;; This file will only work if $GOPATH is defined.  Remember to
;; install Go first.  You'll also need the following:
;; * export GOPATH in your bashrc
;; * export PATH="$PATH:$GOPATH/bin"` in your bashrc
;; * `go get -u github.com/dougm/goflymake` for flycheck
;; * `go get -u github.com/nsf/gocode` for company & eldoc

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
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

;; Eldoc
(use-package go-eldoc
  :ensure t
  :init (add-hook 'go-mode-hook 'go-eldoc-setup))


(provide 'korfuri--golang)
;;; korfuri--golang ends here
