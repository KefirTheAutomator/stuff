(require 'async)

(defun stuff-tools-init ()
  (shell-command "parted /dev/sda mklabel msdos")
  (shell-command "parted /dev/sda mkpart primary ext4 1MiB 100%")
  (shell-command "parted /dev/sda set 1 boot on")

  (shell-command "mkfs.ext4 -L my-root /dev/sda1")

  (shell-command "mount /dev/sda1 /mnt")
  (shell-command "herd start cow-store /mnt")


  (async-start
   (lambda ()
     (shell-command "guix pull -C /etc/configuration/channels.scm"))

   (lambda (result)
     (message
      "guix pull finished: %s" result)
     (async-shell-command
      (concat "guix system init "
	      "/etc/configuration/workstation-vm/workstation-vm.scm "
	      "/mnt")))))

(provide 'tools/init)
