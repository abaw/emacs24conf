(require 'cl)
(require 'org)

(defun abaw/join-path (&rest components)
  "Join path components into a path and return it. For
  example, (abaw/join-path \"a\" \"b\" \"c\") returns \"a/b/c\"
  in unix."
  (when components
    (if (cdr components)
	(concat (file-name-as-directory (car components))
		(apply 'abaw/join-path (cdr components)))
      (car components))))

(defvar abaw/top-dir (file-name-as-directory (file-name-directory (file-truename load-file-name))))
(defvar abaw/lisp-dir (file-name-as-directory (concat abaw/top-dir "lisp")))
(add-to-list 'load-path abaw/lisp-dir)

(defvar abaw/host-dir (abaw/join-path
		       abaw/top-dir
		       "hosts"
		       (substring (shell-command-to-string "hostname") 0 -1)))
(unless (file-directory-p abaw/host-dir)
  (mkdir abaw/host-dir)
  (message "This host does not have directory for customization yet, I created one for you at: %s" abaw/top-dir))


;; FIXME: only tangle and compile file if .org has changed
(org-babel-load-file (expand-file-name "config.org" abaw/top-dir))
