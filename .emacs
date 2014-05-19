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

(add-to-list 'load-path "/home/ju/.opam/4.01.0/share/tuareg")
(load "tuareg-site-file")

;;scss
(setq exec-path (cons "/home/ju/.rvm/gems/ruby-2.1.0/bin/" exec-path))
(add-to-list 'load-path "/home/ju/.emacs.d/")
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; Color theme
(load-file "~/.emacs.d/color-theme-tango.el")
(color-theme-tango)

;;do not indent braces
(setq c-default-style "linux" c-basic-offset 8)
(setq-default tab-width 8)

;; webmode
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
