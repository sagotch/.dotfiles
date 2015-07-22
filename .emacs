;; el-get configuration
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; column mode
(column-number-mode t)

;;paren mode
(show-paren-mode 1)

;; allman style
(setq c-default-style "bsd" c-basic-offset 8)

;; no tab
(setq-default indent-tabs-mode nil)

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

(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
