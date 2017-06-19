;;; korfuri--osx -- My setup for OSX systems

;;; Commentary:
;; OSX systems have a lot of shit and it's really hard to use them for
;; anything that isn't pure media consumption.  Still, for various
;; reasons I have to use an Apple device at work so here's an attempt
;; to make that piece of trash behave like a real computer.
;;
;; If `pbpaste` doesn't work, you're probably running under tmux and
;; you need the OSX-specific hacks in your tmux config to
;; reattach-to-user-namespace when attaching a tmux window.

;;; Code:

;; Makes `command` work as meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


;; Makes emacs' kill-ring integrate with OSX's paste buffer.
;; This may break if run under tmux. Install
;; `reattach-to-user-namespace` from brew and use that to wrap
;; launching the shell that runs emacs.
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(provide 'korfuri--osx)
;;; korfuri--osx.el ends here
