;;; korfuri--basic-major-modes -- My setup for a bunch of major modes

;;; Commentary:
;; This just sets up major modes I need (mostly use-package with
;; :ensure) but don't have a custom setup for.  If I need a custom
;; setup, I'll move it to its own module.

;;; Code:

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(provide 'korfuri--basic-major-modes)
;;; korfuri--basic-major-modes.el ends here
