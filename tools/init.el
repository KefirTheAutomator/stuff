(require 'async)

(defun stuff-tools-init ()
  (let ((configs-dir "/etc/configuration/")
	(answer (read-string "What kind of system init?> ")))
    (stuff-tools-init-prepare-partition)

    (async-start
     (lambda ()
       (stuff-tools-init-pull-channels (concat configs-dir
					       "channels.scm")))

     (lambda (result)
       (message "guix pull ended: %s" result)

       (cond ((equal answer "workstation-vm")
	      (stuff-tools-init-workstation-vm configs-dir))
	     ((equal answer "browser-vm")
	      (stuff-tools-init-browser-vm configs-dir))
	     (t (message "no such system type")))))))
		  

(defun stuff-tools-init-workstation-vm (configs-dir)
  (async-shell-command
   (stuff-tools-init-system (concat configs-dir
				    "workstation-vm.scm"))))

(defun stuff-tools-init-browser-vm (configs-dir)
  (async-shell-command
   (stuff-tools-init-system (concat configs-dir
				    "browser-vm.scm"))))

(defun stuff-tools-init-prepare-partition ()
  "Prepares partition for vm to store system."
  (shell-command "parted /dev/sda mklabel msdos")
  (shell-command "parted /dev/sda mkpart primary ext4 1MiB 100%")
  (shell-command "parted /dev/sda set 1 boot on")

  (shell-command "mkfs.ext4 -L my-root /dev/sda1")

  (shell-command "mount /dev/sda1 /mnt")
  (shell-command "herd start cow-store /mnt"))

(defun stuff-tools-init-pull-channels (channels-file)
  (shell-command (concat "guix pull -C "
			 channels-file)))

(defun stuff-tools-init-system (config-file)
  (concat "guix system init "
	  config-file
	  " /mnt"))

(provide 'tools/init)
