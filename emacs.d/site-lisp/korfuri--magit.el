;;; korfuri--magit -- My setup for Magit

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t)

(defhydra hydra-magit
  ()
  "Magit"
  ("s" magit-status "status")
  ("l" magit-log "log")
  ("L" magit-log-all "log all")
  ("d" magit-diff "diff")
  ("D" magit-diff-staged "diff staged")

  ("c" magit-commit "commit")
  ("m" magit-merge "merge")
  ("p" magit-push "push")
  ("a" magit-stage-file "stage file")

  ("C" magit-checkout "checkout")
  ("!" magit-git-command "command"))

(global-set-key (kbd "C-x g") 'hydra-magit/body)

(provide 'korfuri--magit)
;;; korfuri--magit.el ends here
