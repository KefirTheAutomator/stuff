(defun stuff-config-conditional-set-font (font-size)
  (cond
   ((string-equal system-type "windows-nt")
    (when (member "Consolas" (font-family-list))
	  (set-frame-font
	   (concat "Consolas " (format "%s" font-size))
	   t t)))
   ((string-equal system-type "darwin")
    (when (member "Menlo" (font-family-list))
	  (set-frame-font
	   (concat "Menlo " (format "%s" font-size))
	   t t)))
   ((string-equal system-type "gnu/linux")
    (when (member "DejaVu Math TeX Gyre" (font-family-list))
	  (set-frame-font
	   (concat "DejaVu Sans Mono " (format "%s" font-size))
	   t t)))))

(provide 'stuff/config/conditional)
