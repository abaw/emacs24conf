(defvar abaw/top-dir (file-name-as-directory (file-name-directory load-file-name)))
(defvar abaw/config-dir (file-name-as-directory (concat abaw/top-dir "config")))
(defvar abaw/lisp-dir (file-name-as-directory (concat abaw/top-dir "lisp")))
(defvar abaw/profiles-dir (file-name-as-directory (concat abaw/top-dir "profiles")))
(defvar abaw/profile-link (concat abaw/top-dir "profile"))

(mapc (lambda (path) (add-to-list 'load-path path))
      (list abaw/config-dir abaw/lisp-dir))

(let ((profile-init-el (concat abaw/profile-link "/" "init.el")))
  (unless (and (file-symlink-p abaw/profile-link)
	       (file-exists-p profile-init-el))
    (error (format "%s should link to a profile directory" abaw/profile-link)))

  (load-library "basic-config")
  (load-library "global-bindings-config")
  (load profile-init-el))

