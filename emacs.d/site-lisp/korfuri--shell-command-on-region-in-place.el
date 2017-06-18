;; Hannes' trick to pipe a region to a command, and replace it with
;; the command's output
(defun shell-command-on-region-in-place ()
  "Like shell-command-on-region but replaces the selected buffer with the result."
  (interactive)
  (if (use-region-p)
      (shell-command-on-region
       (region-beginning)
       (region-end)
       (read-from-minibuffer "Shell command on region (replace): " nil nil nil 'shell-command-history)
       t)))

(provide 'korfuri--shell-command-on-region-in-place)
