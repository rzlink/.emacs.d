;;; This file defines all customize functions

;; function used to open init.el file
(defun open-my-init-file()
  "Open file init.el under .emacs.d folder"
  (interactive)
  (find-file "~/.emacs.d/init.el")) 

(provide 'my-functions)
