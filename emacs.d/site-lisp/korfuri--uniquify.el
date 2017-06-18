;; make sure that if I do have two buffers open
;; on the same file, the git client will occur somewhere in the buffer name
(use-package uniquify
  :init (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

(provide 'korfuri--uniquify)
