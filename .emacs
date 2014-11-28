;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       (concat
	"https://raw.githubusercontent.com/dimitri/"
	"el-get/master/el-get-install.el"))
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; package list to be installed
(setq my:el-get-packages
      '(tuareg-mode
	scala-mode2
	plantuml-mode
	yasnippet
	yasnippet-config
	yasnippet-snippets
	yasnippets
	auto-complete
	color-theme
	color-theme-tangotango
        ))
(el-get 'sync my:el-get-packages)

;; load tango color them
(color-theme-tangotango)

;; column mode
(column-number-mode t)

;;paren mode
(show-paren-mode 1)

;; allman style
(setq c-default-style "bsd" c-basic-offset 8)

;; auto closing tags
(defun insert-around-region (a b) "insert a and b around current region"
  (if mark-active
      (let ()
        (if (> (point) (mark)) (exchange-point-and-mark))
        (insert a)
        (exchange-dot-and-mark)
      (insert b))
    (let () (insert a) (insert b) (backward-char 1))))
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
