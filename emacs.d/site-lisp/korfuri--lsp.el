;;; korfuri--lsp --- My setup to use LSP and more.

;;; Commentary:
;; My setup for LSP.  Will add DAP as well.

;;; Code:

(use-package spinner)

(add-to-list 'load-path
              "~/.emacs.d/site-lisp/yasnippet-0.14.0")
(require 'yasnippet)

(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package company-lsp
  :ensure t)

(use-package lsp-ui
  :ensure t)

;; (use-package lsp-treemacs
;;   :ensure t)

(provide 'korfuri--lsp)
;;; korfuri--lsp.el ends here
