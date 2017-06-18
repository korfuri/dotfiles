(use-package ido
  :init (ido-mode t))

;; For some reason, using this binding as use-package's :bind doesn't
;; work.
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

(provide 'korfuri--ido)

