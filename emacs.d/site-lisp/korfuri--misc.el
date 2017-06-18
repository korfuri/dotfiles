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

;; Prevent typos
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; Browse
(global-set-key [C-down-mouse-1] 'browse-url-at-mouse)

;; Make font size behave like in a terminal
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(provide 'korfuri--misc)
