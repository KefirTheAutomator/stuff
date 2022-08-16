(defun stuff-tools-check-isguix ()
  "Checks if guix is presented on a system."
  (file-directory-p "/gnu/store"))

(provide 'tools/check)
