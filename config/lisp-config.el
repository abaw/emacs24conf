(abaw/package-install 'paredit)
(abaw/package-install 'hl-sexp)

(defun abaw/lisp-hook ()
  (eldoc-mode t)
  (hl-sexp-mode t)
  (paredit-mode t))

(mapc (lambda (mode)
	(add-hook (intern (concat (symbol-name mode) "-hook")) 'abaw/lisp-hook))
      '(lisp-mode emacs-lisp-mode ielm-mode))


