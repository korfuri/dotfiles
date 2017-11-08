(unless (package-installed-p 'zenburn-theme)
  (package-refresh-contents)
  (package-install 'zenburn-theme))

(defvar zenburn-override-colors-alist
  '(("zenburn-bg"       . "#000000")
    ("zenburn-bg-05"    . "#408040")
    ("zenburn-bg+05"    . "#101010")
    ("zenburn-bg+1"     . "#202020")
    ("zenburn-bg+2"     . "#404040")
    ("zenburn-bg+3"     . "#606060")))

(load-theme 'zenburn t)

(provide 'korfuri--theme)
