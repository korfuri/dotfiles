;;; korfuri--hcl -- My setup for HCL mode (Hashicorp Config Language)

;;; Commentary:

;;; Code:

(use-package "hcl-mode"
  :ensure t)

(use-package "terraform-mode"
  :ensure t
  :mode ("\\.tf\\'" . terraform-mode))

(use-package "company-terraform"
  :ensure t
  :init (company-terraform-init))

(provide 'korfuri--hcl)
;;; korfuri--hcl.el ends here
