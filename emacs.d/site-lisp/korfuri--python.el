;;; korfuri--python -- summary

;;; Commentary:
;; Convenience functions to edit Python.
;; Plays nice with korfuri--autocomplete.el which should already
;; support Python out-of-the-box (but this will require installing
;; pylint).
;; Requires:
;; * `pip install jedi` for the Jedi completion system
;; * `pip install epc` for the EPC emacs<->python RPC system

;;; Code:

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'company-jedi-setup))

(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))

(provide 'korfuri--python)
;;; korfuri--python.el ends here
