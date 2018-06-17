(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(emacs-lisp-mode-hook (quote (paredit-mode)))
 '(exec-path
   (quote
    ("~/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/local/games" "/usr/sbin" "/usr/bin" "/usr/games" "/sbin" "/bin" "/usr/lib/emacs/25.1/x86_64-linux-gnu")))
 '(inf-clojure-generic-cmd (quote ("localhost" . 5555)))
 '(inf-clojure-lein-cmd "")
 '(inf-clojure-project-type "generic")
 '(inverse-video nil)
 '(make-backup-files nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
     ("marmalade-repo" . "http://marmalade-repo.org/packages/"))))
 '(package-selected-packages
   (quote
    (counsel ivy counsel-projectile inf-clojure switch-window zoom magit key-chord ido-vertical-mode paredit paredit-everywhere paredit-menu ace-jump-mode ido-ubiquitous clojure-mode-extra-font-locking cljsbuild-mode cider-browse-ns cider align-cljlet counsel-ebdb)))
 '(projectile-enable-caching t)
 '(safe-local-variable-values
   (quote
    ((eval cider-register-cljs-repl-type
	   (quote fm)
	   "(require 'figwheel.main)(figwheel.main/start \"dev\")"
	   (quote cider-verify-piggieback-is-present)))))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "monotype" :family "Cousine"))))
 '(mode-line ((t (:background "deep sky blue" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "gainsboro" :distant-foreground "gtk_selection_fg_color")))))

(require 'package)
(package-initialize)

(defalias 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)

(show-paren-mode)
(key-chord-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode)
(projectile-mode 1)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)

(add-to-list 'load-path "~/.emacs.d/site")
(load "key-bindings")
(load "cbl")

(setenv "SSH_AUTH_SOCK" "/tmp/ssh-MRJHWcMmz1ab/agent.2191")
(setenv "SSH_AGENT_PID" "2192")
