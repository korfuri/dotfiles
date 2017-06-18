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

(provide 'korfuri--tmux)
