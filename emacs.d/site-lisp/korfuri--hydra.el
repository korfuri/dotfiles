;;; korfuri-hydra -- package summary

;;; Commentary:
;; Collection of global hydras for korfuri.  Other hydras can be
;; provided by other modules too.

;;; Code:

(use-package hydra
  :ensure t)

;; Hydra for movement functions
(global-set-key
 (kbd "C-n")
 (defhydra hydra-move
  (:body-pre (next-line))
   "move"
   ("n" next-line "next line")
   ("p" previous-line "prev line")
   ("f" forward-char "next char")
   ("b" backward-char "prev char")
   ("a" beginning-of-line "home")
   ("e" move-end-of-line "endl")
   ("v" scroll-up-command "scrollup")
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command "scrolldown")
   ("l" recenter-top-bottom "recenter")))

;; Hydra for the M-g family of keybidings
(global-set-key
 (kbd "M-g")
 (defhydra hydra-goto
   (:pre (linum-mode 1)
    :post (linum-mode -1))
   "goto"
   ("g" goto-line "go")
   ("m" set-mark-command "mark" :bind nil)
   ("q" nil "quit")
   ("<" beginning-of-buffer "buffer-begin")
   (">" end-of-buffer "buffer-end")
   ("e h" first-error "error-first")
   ("e j" next-error "error-next")
   ("e k" previous-error "error-prev")
   ("e v" recenter-top-bottom "error-recenter")))

(global-set-key
 (kbd "C-h")
 (defhydra hydra-apropos ()
   "Apropos"
   ("a" apropos "apropos")
   ("c" apropos-command "cmd")
   ("d" apropos-documentation "doc")
   ("e" apropos-value "val")
   ("l" apropos-library "lib")
   ("o" apropos-user-option "option")
   ("u" apropos-user-option "option")
   ("v" apropos-variable "var")
   ("i" info-apropos "info")
   ("t" tags-apropos "tags")
   ("z" hydra-customize-apropos/body "customize")))

(global-set-key
 (kbd "C-c m")
 (defhydra hydra-transpose ()
   "Transpose"
   ("c" transpose-chars "characters")
   ("w" transpose-words "words")
   ("o" org-transpose-words "Org mode words")
   ("l" transpose-lines "lines")
   ("s" transpose-sentences "sentences")
   ("e" org-transpose-elements "Org mode elements")
   ("p" transpose-paragraphs "paragraphs")
   ("t" org-table-transpose-table-at-point "Org mode table")
   ("q" nil "cancel" :color blue)))

(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                                     :color pink
                                     :hint nil
                                     :post (deactivate-mark))
  "
  ^_k_^       _w_ copy      _o_pen       _N_umber-lines
_h_   _l_     _y_ank        _t_ype       _e_xchange-point
  ^_j_^       _d_ kill      _c_lear      _r_eset-region-mark
^^^^          _u_ndo        _g_ quit     ^ ^
"
  ("k" rectangle-previous-line)
  ("j" rectangle-next-line)
  ("h" rectangle-backward-char)
  ("l" rectangle-forward-char)
  ("d" kill-rectangle)                    ;; C-x r k
  ("y" yank-rectangle)                    ;; C-x r y
  ("w" copy-rectangle-as-kill)            ;; C-x r M-w
  ("o" open-rectangle)                    ;; C-x r o
  ("t" string-rectangle)                  ;; C-x r t
  ("c" clear-rectangle)                   ;; C-x r c
  ("e" rectangle-exchange-point-and-mark) ;; C-x C-x
  ("N" rectangle-number-lines)            ;; C-x r N
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)))
  ("u" undo nil)
  ("g" nil))
(global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)


(provide 'korfuri--hydra)
;;; korfuri-hydra.el ends here
