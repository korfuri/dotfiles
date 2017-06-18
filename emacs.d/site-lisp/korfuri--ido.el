;;; korfuri--ido --- Summary

;;; Commentary:
;; Uses Ido-mode globaly, and smex for M-x.

;;; Code:

(use-package ido
  :init (ido-mode t))

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind (("M-x"         . smex)
	 ("M-X"         . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command)))

(custom-set-variables
 '(ido-confirm-unique-completion t)
 '(ido-default-buffer-method (quote samewindow))
 '(ido-default-file-method (quote selected-window))
 '(ido-everywhere t))

(provide 'korfuri--ido)
;;; korfuri--ido.el ends here
