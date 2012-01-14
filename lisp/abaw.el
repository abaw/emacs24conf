(defun abaw/package-install (package)
  "install a package using `package-install' if it has not been installed yet."
  (unless (package-installed-p package)
    (package-install package)))

(provide 'abaw)
