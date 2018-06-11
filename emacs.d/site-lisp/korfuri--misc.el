(custom-set-variables
 '(case-fold-search t)
 '(inhibit-startup-screen t)
 '(suggest-key-bindings 1))
 '(global-font-lock-mode t nil (font-lock))

;; Face height
(set-face-attribute 'default nil :height 105)
;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)
;; Show column number
(column-number-mode t)
;; highlight matching parenthesis
(show-paren-mode t)

;; always end a file with a newline
(setq require-final-newline t)
;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;; Remove silly tool & menu bars in graphical mode.
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Browse
(global-set-key [C-down-mouse-1] 'browse-url-at-mouse)

;; Make font size behave like in a terminal
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Disable a minor mode in every buffer

;; This can be used to reset the font size in every buffer:
;;    `M-x global-disable-mode text-scale-mode'.
(defun global-disable-mode (mode-fn)
  "Disable `MODE-FN' in ALL buffers."
  (interactive "aMode: ")
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (funcall mode-fn -1))))

(provide 'korfuri--misc)
;;; korfuri--misc.el ends here
