;;; korfuri--flyspell --- My setup for flyspell

;;; Commentary:
;; My setup for Flyspell.  Enables flyspell-prog-mode globally to
;; spellcheck comments too.

;;; Code:

(use-package flyspell-popup
  :ensure t
  :config (progn
	    (add-hook 'flyspell-mode-hook #'flyspell-popup-auto-correct-mode)
	    (define-key flyspell-mode-map (kbd "C-c ;") #'flyspell-popup-correct)))

(custom-set-variables
 '(flyspell-popup-correct-delay 0.7))

(add-hook 'c++-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'go-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'python-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'js-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'protobuf-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'ruby-mode-hook (lambda () (flyspell-prog-mode)))

(add-hook 'text-mode-hook (lambda () (flyspell-mode)))
(add-hook 'markdown-mode-hook (lambda () (flyspell-mode)))


(provide 'korfuri--flyspell)
;;; korfuri--flyspell.el ends here
