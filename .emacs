(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Affiche le numéro de ligne et de colonne
(column-number-mode t)
(line-number-mode t)

;;parentheses matching
(show-paren-mode 1)

;;goto shortcut
(global-set-key [(control l )] 'goto-line)

;;line number diplay
(global-linum-mode t)

;; No tab, 4 spaces indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;;scss
;;(setq exec-path (cons "/home/ju/.rvm/gems/ruby-2.1.0/bin/" exec-path))
;;(add-to-list 'load-path "/home/ju/.emacs.d/")
;;(autoload 'scss-mode "scss-mode")
;;(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; Color theme
(load-file "~/.emacs.d/color-theme-tango.el")
(color-theme-tango)

;;do not indent braces
(setq c-default-style "linux" c-basic-offset 8)
(setq-default tab-width 8)

;; webmode
(add-to-list 'load-path "/home/ju/.emacs.d")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))


;; javadoc-help
;;(require 'javadoc-help)
;;(global-set-key [(f1)]          'javadoc-lookup)  ; F1 to lookup
;;(global-set-key [(shift f1)]    'javadoc-help)    ; Shift-F1 to bring up menu
;;(javadoc-set-predefined-urls '( "http://docs.oracle.com/javase/7/docs/api/"))

(add-to-list 'load-path "/home/ju/.opam/4.01.0/share/tuareg")
(load "tuareg-site-file")

(defun insert-around-region (a b) "insert a and b around current region"
  (if mark-active
      (let ()
        (if (> (point) (mark)) (exchange-point-and-mark))
        (insert a)
        (exchange-dot-and-mark)
      (insert b))
    (let () (insert a) (insert b) (backward-char 1))
))
(defun insert-parentheses () "insert parentheses around region"
  (interactive) (insert-around-region "(" ")"))
(defun insert-brackets () "insert brackets around region"
  (interactive) (insert-around-region "[" "]"))
(defun insert-braces () "insert curly braces around region"
  (interactive) (insert-around-region "{" "}"))
(defun insert-quotes () "insert quotes around region"
  (interactive) (insert-around-region "\"" "\""))

(global-set-key "(" 'insert-parentheses)
(global-set-key "[" 'insert-brackets)
(global-set-key "{" 'insert-braces)
(global-set-key "\"" 'insert-quotes)

;; save hook
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;ocp-indent
(add-to-list 'load-path
  (concat
    (replace-regexp-in-string "\n$" ""
       (shell-command-to-string "opam config var share"))
    "/emacs/site-lisp"))
(require 'ocp-indent)
