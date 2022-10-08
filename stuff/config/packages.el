(setq stuff-config-packages-list
	  '(eglot async company))

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(defun stuff-config-packages-install-packages ()
  (package-initialize)

  (unless package-archive-contents
	(package-refresh-contents))

  (dolist (package stuff-config-packages-list)
	(unless (package-installed-p package)
      (package-install package))))

(provide 'stuff/config/packages)
