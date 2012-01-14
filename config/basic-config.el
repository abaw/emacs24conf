;; This file include the super basic configurations

;; using package.el and include marmalade package archive
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'abaw)

;; a bigger kill-ring buffer
(setq kill-ring-max 200)

;; utf-8 is good
(set-language-environment 'utf-8)


;; yes/no => y/n
(fset 'yes-or-no-p 'y-or-n-p)

(load-library "ido-config")
(load-library "lisp-config")

