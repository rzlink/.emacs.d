;; turn off tool bar
(tool-bar-mode -1)

;; turn off menu
(message "turning off menu...")
(menu-bar-mode -1)

;; turn off scroll bar
(scroll-bar-mode -1)

;; turn off inhibit startup screen
(setq inhibit-startup-screen t)

;; open with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; highligh current line
(global-hl-line-mode t)

;; modify the title bar to display the current file name
;; TODO: add user and host name in the title
;; https://www.emacswiki.org/emacs/FrameTitle
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(provide 'init-ui)
