;; YCM configuration

(require 'ycmd)
(ycmd-setup)
(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'python-mode-hook 'ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/path/to/ycmd/package"))
;; (set-variable 'ycmd-global-config "/path/to/global_config.py")

(define-key company-active-map [return] 'company-abort)
(define-key company-active-map [tab] 'company-complete-selection)
(setq company-idle-delay 0.8)


(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
