(defun stuff-tools-guix-p ()
  "Checks if guix is presented on a system."
  (file-directory-p "/gnu/store"))

(provide 'tools/check)
