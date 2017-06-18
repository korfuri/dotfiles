;; korfuri--markdown-mode -- summary

;;; Commentary:
;; multimarkdown can be installed with:
;;   `sudo apt-get install libtext-multimarkdown-perl`

;;; Code:
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


(provide 'korfuri--markdown-mode)
;;; korfuri--markdown-mode.el ends here
