;;; korfuri--hideshow -- my setup for hideshow

;;; Commentary:
;; Also enables hideshowvis which shows folds in the fringe.

;;; Code:
(use-package hideshowvis
  :config (progn
	    (dolist (hook (list 'emacs-lisp-mode-hook
				'c++-mode-hook
				'go-mode-hook))
	      (add-hook hook 'hideshowvis-enable))
	    ))

(provide 'korfuri--hideshow)
;;; korfuri--hideshow.el ends here
