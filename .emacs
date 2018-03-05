(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (magit paredit slime)))
 '(truncate-lines t))

(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/")  t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "/run/current-system/sw/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(let ((mode-hooks '(emacs-lisp-mode-hook
		    eval-expression-minibuffer-setup-hook
		    lisp-mode-hook
		    lisp-interaction-mode-hook)))
  (dolist (mode-hook mode-hooks)
    (add-hook mode-hook #'enable-paredit-mode)))

(require 'asm-mode)
(add-hook
 'asm-mode-hook
 (lambda () (electric-indent-mode -1)))

(define-key asm-mode-map (kbd "RET") 'newline)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
