;;; korfuri--hcl -- My setup for HCL mode (Hashicorp Config Language)

;;; Commentary:

;;; Code:

(use-package "hcl-mode"
  :ensure t
  :mode ("\\.tf\\'" . hcl-mode))

(provide 'korfuri--hcl)
;;; korfuri--hcl.el ends here
