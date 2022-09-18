(require 'tools/check)
(require 'tools/backup)

(defvar stuff-font-size 14)

(defun stuff-config ()
  (interactive)

  (setq backup-by-copying t)
  (setq backup-directory-alist '(("." . "~/.emacs-saves/")))

  (setq delete-old-versions t)
  (setq kept-new-versions 6)
  (setq kept-old-versions 2)
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (setq dired-listing-switches "-alFh")

  (menu-bar-mode -1)
  (when (display-graphic-p)
    (scroll-bar-mode -1)
    (tool-bar-mode -1))

  (stuff-set-font)
  (stuff-check-if-melpa-needed))

(defun stuff-set-font ()
  (cond
   ((string-equal system-type "windows-nt")
    (when (member "Consolas" (font-family-list))
	  (set-frame-font
	   (concat "Consolas " (format "%s" stuff-font-size))
	   t t)))
   ((string-equal system-type "darwin")
    (when (member "Menlo" (font-family-list))
	  (set-frame-font "Menlo" t t)))
   ((string-equal system-type "gnu/linux")
    (when (member "DejaVu Math TeX Gyre" (font-family-list))
	  (set-frame-font
	   (concat "DejaVu Sans Mono " (format "%s" stuff-font-size))
	   t t)))))

(defun stuff-check-if-melpa-needed ()
  (cond
   ((string-equal system-type "windows-nt")
    (stuff-add-melpa))
   ((string-equal system-type "darwin")
    (stuff-add-melpa))
   ((string-equal system-type "gnu/linux")
    (stuff-add-melpa))))

(defun stuff-add-melpa ()
  (require 'package)
  (add-to-list 'package-archives
			   '("melpa" . "https://melpa.org/packages/")
			   t)
  (add-to-list 'package-archives
			   '("melpa-stable" . "https://stable.melpa.org/packages/")
			   t)
  (package-initialize))

(provide 'stuff)
