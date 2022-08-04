(defun stuff-tools-backup-data ()
  (interactive)
  (let ((out-file-name (concat (format-time-string "%Y-%B-%d")
			       ".zip"))
	(flags "-P 2244 -r ")
	(previous-directory (pwd)))
    (shell-command
     (concat "zip " flags out-file-name " " (getenv "HOME") "/data/"))))

(provide 'tools/backup)
