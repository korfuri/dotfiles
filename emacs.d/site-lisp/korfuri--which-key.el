;;; korfuri--which-key -- My which-key setup

;;; Commentary:
;; https://github.com/justbur/emacs-which-key for reference.

;;; Code:

(use-package which-key
  :ensure t
  :config (which-key-mode))

(which-key-setup-side-window-bottom)

(provide 'korfuri--which-key)
;;; korfuri--which-key.el ends here
