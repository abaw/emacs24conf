(defvar abaw/top-dir (file-name-as-directory (file-name-directory load-file-name)))
(defvar abaw/lisp-dir (file-name-as-directory (concat abaw/top-dir "lisp")))
(add-to-list 'load-path abaw/lisp-dir)

;; FIXME: only tangle and compile file if .org has changed
(org-babel-load-file (expand-file-name "config.org" abaw/top-dir))


