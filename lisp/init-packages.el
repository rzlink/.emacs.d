;;; This file is used for initialize all package related settings

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; add whatever packages you want here
(defvar davwei/packages '(
			  which-key
			  counsel
			  swiper
			  ) "Default packages")

(setq package-selected-packages davwei/packages)

(require 'cl)
(defun davwei/packages-installed-p()
  (loop for pkg in davwei/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (davwei/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg davwei/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; enable which key mode
;;(which-key-mode)

;; config ivy-mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(provide 'init-packages)
