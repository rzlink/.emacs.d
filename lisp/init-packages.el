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
			  company
			  popwin
			  youdao-dictionary
			  magit
			  spacegray-theme
			  monokai
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

;; config company mode
(global-company-mode t)
(setq-default company-minimum-prefix-length 1)
(setq-default company-idle-delay 0.08)

;; config for youdao-dictionary
;; Enable Cache
(setq url-automatic-caching t)

;; popwin config
(require 'popwin)
(popwin-mode 1)

;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
(push "*Youdao Dictionary*" popwin:special-display-config)

(provide 'init-packages)
