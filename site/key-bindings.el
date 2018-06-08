(defmacro i-lambda (&rest body)
  `(lambda nil (interactive) (progn ,@body)))

(global-set-key (kbd "M-+") 'cbl/font-size/increase)
(global-set-key (kbd "M-_") 'cbl/font-size/decrease)
		

(when (boundp 'key-chord-mode)
  (key-chord-define-global "1="  'magit-status)
  (key-chord-define-global "fj"  'switch-window)
  (key-chord-define-global "dk"  (i-lambda (other-frame 1))))

;; Arrow keys
(global-set-key (kbd "<C-up>")      'paredit-backward)     ;; Control Up Arrow
(global-set-key (kbd "<C-down>")    'paredit-forward)      ;; Control Down Arrow
(global-set-key (kbd "<prior>")     'beginning-of-buffer)  ;; Meta Up Arrow
(global-set-key (kbd "<next>")      'end-of-buffer)        ;; Meta Down Arrow
(global-set-key (kbd "<M-right>")   'cbl/get-next-sexp)    ;; Meta Right Arrow


(global-set-key (kbd "C-s")           'isearch-forward-regexp)
(global-set-key (kbd "C-M-s")         'isearch-forward)
(global-set-key (kbd "C-r")           'isearch-backward-regexp)
(global-set-key (kbd "C-M-r")         'isearch-backward)
(global-set-key (kbd "C-x C-b")       'helm-buffers-list)
(global-set-key (kbd "C-x SPC")       'just-one-space)
(global-set-key (kbd "<C-delete>")    (i-lambda (kill-buffer nil))) ;; C-M-Backspace

;; I don't use digit-argument
(global-set-key (kbd "C-0")         'delete-window)
(global-set-key (kbd "C-1")         'delete-other-windows)
(global-set-key (kbd "C-2")         'split-window-vertically)
(global-set-key (kbd "C-3")         'split-window-horizontally)


;; Top row keys
(global-set-key (kbd "<XF86Back>")        (i-lambda (shell (switch-to-buffer  "*shell*")))) ;; the left arrow key next to ESC
(global-set-key (kbd "<XF86Reload>")      'counsel-git)                                     ;; Circle arrow key
(global-set-key (kbd "<C-XF86Reload>")    'counsel-git-grep)                                ;; CONTROL circle arrow key
(global-set-key (kbd "<XF86AudioPlay>")   'ibuffer)                                         ;; >|| key
(global-set-key (kbd "<C-XF86AudioPlay>") 'dired)                                           ;; CONTROL >|| key



;; No Super or Hyper keys, sigh
;; (global-set-key (kbd "s-s")         (i-lambda (shell (switch-to-buffer  "*shell*"))))
;; (global-set-key (kbd "s-;")         'comment-region)
;; (global-set-key (kbd "s-w")         'cbl/buffer-file-name)
;; (global-set-key (kbd "H-s")         'query-replace-regexp)
;; (global-set-key (kbd "s-p")         'previous-buffer)
;; (global-set-key (kbd "s-n")         'next-buffer)
;; (global-set-key (kbd "H-SPC")       'ace-jump-mode)
;; (global-set-key (kbd "H-<right>")   (i-lambda (shrink-window-horizontally -1)))
;; (global-set-key (kbd "H-<up>")      (i-lambda (shrink-window -1)))
;; (global-set-key (kbd "H-<left>")    'shrink-window-horizontally)
;; (global-set-key (kbd "H-<down>")    'shrink-window)
;; (global-set-key (kbd "H-g")         'helm-grep-do-git-grep)
;; (global-set-key (kbd "H-c")         'counsel-git)
;; (global-set-key (kbd "<next>")      'kill-ring-save)
