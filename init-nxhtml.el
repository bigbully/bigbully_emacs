;; (load "/elpa/nxhtml/autostart.el")

(autoload 'eruby-nxhtml-mumamo-mode "autostart.el" "Edit erb document." t)
(add-to-list 'auto-mode-alist '("\\.erb" . eruby-nxhtml-mumamo-mode))

(setq mumamo-background-colors nil)  
  
(eval-after-load "bytecomp"  
  '(add-to-list 'byte-compile-not-obsolete-vars  
                'font-lock-beginning-of-syntax-function))  
(eval-after-load "bytecomp"  
  '(add-to-list 'byte-compile-not-obsolete-vars  
              'font-lock-syntactic-keywords))  
;; (load "C:/users/BINADI/AppData/Roaming/.emacs.d/elpa/nxhtml/autostart.el")
;; (load "../nxhtml/autostart.el")
(provide 'init-nxhtml)
