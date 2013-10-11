;; Uriel Corfa's .emacs

;; Load stuff from .emacs.d
(add-to-list 'load-path "~/.emacs.d")


;; Machine-specific stuff is in .emacs.d/emacs.local.el
(load-file "~/.emacs.d/machine.emacs.el")

;; Custom does its things here

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(inhibit-startup-screen t))
 '(global-font-lock-mode t nil (font-lock))


;; Various personal settings

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

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <C-up>") 'windmove-up)
(global-set-key (kbd "C-x <C-down>") 'windmove-down)
(global-set-key (kbd "C-x <C-right>") 'windmove-right)
(global-set-key (kbd "C-x <C-left>") 'windmove-left)

(require 'color-theme)
;;(if (boundp 'color-theme-initialize)
(color-theme-initialize)
;;  nil)
(color-theme-hober)
; Fix : when opening a new frame/client the theme is not applied correctly.
; C-x <f12> to re-apply the theme
(global-set-key (kbd "C-x <f12>") 'color-theme-hober)

;; hook: test win sys and rerun color-theme
(defun
  reapply-color-theme(frame)
  (color-theme-hober)
  )
;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'reapply-color-theme)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; Ido !

(require 'ido)
(custom-set-variables '(ido-everywhere t)
                      '(ido-confirm-unique-completion t)
                      '(ido-default-file-method 'selected-window)
                      '(ido-default-buffer-method 'samewindow))
(ido-mode t)

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))


(require 'kill-ring-rotate)
(global-set-key (kbd "<f2>") 'kill-ring-rotate)

;; Prevent typos
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; Browse
(global-set-key [C-down-mouse-1] 'browse-url-at-mouse)

;; Make font size behave like in a terminal
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; By heder@google.com
(defun shell-command-on-region-in-place ()
  "Like shell-command-on-region but replaces the selected buffer with the result."
  (interactive)
  (if (use-region-p)
      (shell-command-on-region
       (region-beginning)
       (region-end)
       (read-from-minibuffer "Shell command on region (replace): " nil nil nil 'shell-command-history)
       t)))

;; make sure that if I do have two buffers open
;; on the same file, the git client will occur somewhere in the buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))


;; from misc-cmds.el by Drew Adams
;; http://emacswiki.org/emacs/misc-cmds.el
(defun kill-buffer-and-its-windows (buffer)
  "Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string)."
  (interactive (list (read-buffer "Kill buffer: " (current-buffer) 'existing)))
  (setq buffer  (get-buffer buffer))
  (if (buffer-live-p buffer)            ; Kill live buffer only.
      (let ((wins  (get-buffer-window-list buffer nil t))) ; On all frames.
        (when (and (buffer-modified-p buffer)
                   (fboundp '1on1-flash-ding-minibuffer-frame))
          (1on1-flash-ding-minibuffer-frame t)) ; Defined in `oneonone.el'.
        (when (kill-buffer buffer)      ; Only delete windows if buffer killed.
          (dolist (win  wins)           ; (User might keep buffer if modified.)
            (when (window-live-p win) (delete-window win)))))
    (when (interactive-p)
      (error "Cannot kill buffer.  Not a live buffer: `%s'" buffer))))

;; Remap some keys to work when emacs is suspended (^Z) and revived
;; (fg) under tmux/screen
(define-key function-key-map "\eOA" [up])
(define-key function-key-map "\e[A" [up])
(define-key function-key-map "\eOB" [down])
(define-key function-key-map "\e[B" [down])
(define-key function-key-map "\eOC" [right])
(define-key function-key-map "\e[C" [right])
(define-key function-key-map "\eOD" [left])
(define-key function-key-map "\e[D" [left])
(global-set-key "\e[4^" 'end-of-buffer)
(global-set-key (kbd "M-[ F") 'end-of-line)
(global-set-key "\eO4^" 'end-of-buffer)
(global-set-key "\e[1^" 'beginning-of-buffer)
(global-set-key (kbd "M-[ H") 'beginning-of-line)
(global-set-key "\eO1^" 'beginning-of-buffer)
