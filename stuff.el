(require 'stuff/config/base)
(require 'stuff/config/conditional)
(require 'stuff/config/packages)
(require 'stuff/tools/check)

(defvar stuff-font-size 14)

(defun stuff-init ()
  "Entry point"
  (interactive)
  (stuff-config-base)
  (stuff-config-conditional-set-font stuff-font-size)
  (if (not (stuff-tools-check-guix-p))
	  (stuff-config-packages-install-packages)))

(provide 'stuff)
