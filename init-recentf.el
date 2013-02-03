;;http://www.emacswiki.org/emacs/RecentFiles

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 300
      recentf-exclude '("/tmp/" "/ssh:"))
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(provide 'init-recentf)
