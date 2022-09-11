(require 'tools/check)
(require 'tools/backup)
(if (stuff-tools-check-isguix)
    (require 'tools/init))

(defvar stuff-font-size 10)

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

  (cond
   ((string-equal system-type "windows-nt")
    (when (member "Consolas" (font-family-list))
      (set-frame-font "Consolas" t t)))
   ((string-equal system-type "darwin")
    (when (member "Menlo" (font-family-list))
      (set-frame-font "Menlo" t t)))
   ((string-equal system-type "gnu/linux")
    (when (member "DejaVu Math TeX Gyre" (font-family-list))
      (set-frame-font
       (concat "DejaVu Sans Mono "
	       (format "%s" stuff-font-size))
       t t)))))

(provide 'stuff)
