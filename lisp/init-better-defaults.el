;; init-better-defaults.el

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; display line number
(global-linum-mode t)

;; show recent files
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; add delete section mode
(delete-selection-mode t)

(provide 'init-better-defaults)
