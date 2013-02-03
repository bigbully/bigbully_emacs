;; -*- coding: utf-8 -*-
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *spell-check-support-enabled* t)
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )

;----------------------------------------------------------------------------
; Load configs for specific features and modes
;----------------------------------------------------------------------------
(require 'init-modeline);;done
(require 'init-frametitle);;done

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-compat);;done用来处理23,24版本中string-prefix-p,called-interactively-p两个方法的兼容性问题
(require 'init-utils);;almost done
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa);;elpa emacs用来自动跟进插件的工具
;;(require 'init-exec-path) ;; Set up $PATH 只在MAC有用
(require 'init-frame-hooks);;真心不知道干嘛用的
(require 'init-xterm);;和上面的是一块儿的，和设置键位有关，不过还是没看明白干什么用的
;;(require 'init-osx-keys);;顾名思义 for mac
(require 'init-gui-frames);;opacity in it
(require 'init-maxframe);;和初始最大化有关
;;(require 'init-proxies);;for Mac
(require 'init-dired);;done
(require 'init-isearch);;done
(require 'init-uniquify);;Nicer naming of buffers for files with identical names
(require 'init-ibuffer);;done
(require 'init-flymake);;undone
;;(require 'init-artbollocks-mode);;用来做英语常用语检查的
(require 'init-recentf);;done C-x C-r
(require 'init-ido);;done C-x f,C-x b,M-x都有ido功能
;;(require 'init-hippie-expand);;HippieExpand并不是首选
(require 'init-windows);;非常有趣！C-x 4 u,C-x 4 r,C-x 2,C-x 3,C-x |,C-x _
(require 'init-sessions);;管理session中寄存多少个文件
(require 'init-fonts);;放大缩小字体C-M-=, C-M--
(require 'init-mmm);;undone
;;(require 'init-growl);;for mac
(require 'init-editing-utils);; cua-mode|C-.|C-;|C-<|C->|C-c p|M-up|M-down|M-;|M-k|
;; (require 'init-darcs);;一个版本控制工具
(require 'init-git);;undone 和git有关，但不知道是什么东西
;; (require 'init-crontab);;和crontab有关，操作linux系统下守护进程的文件包
(require 'init-textile);;一种标记语言
(require 'init-markdown);;一种标记语言
(require 'init-csv);;针对csv文件
;; (require 'init-erlang)
(require 'init-javascript)
;; (require 'init-sh)
;; (require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-css)
;; (require 'init-haml);;缩进和 yaml-mode,python-mode冲突的解决方案
;; (require 'init-python-mode)
;; (require 'init-haskell)
(require 'init-ruby-mode);;ruby相关等到写ruby的时候再研究
(require 'init-rails);;ruby相关等到写ruby的时候再研究
;; (require 'init-rcirc);;IRC client
(require 'init-lisp)
;; (require 'init-slime);;common lisp ide
;; (require 'init-clojure)
;; (require 'init-common-lisp)


(when *spell-check-support-enabled*  (require 'init-spelling));;undone
;; 
(require 'init-marmalade);;a package archive for Emacs Lisp
;; 
;;  Finally set up themes, after most possibly-customised faces have been defined
(require 'init-themes)

;;  Chinese inut method
;; (require 'init-org2blog);;no need
(require 'init-fill-column-indicator);;undone
(require 'init-yasnippet);;使用的时候stack溢出，需要检查一下原因
;; (require 'init-better-registers) ; C-x j - jump to register;;undone
(require 'init-zencoding-mode) ;behind init-better-register to override C-j
(require 'init-yari);;yari.el provides an Emacs frontend to Ruby's `ri' documentation tool. It offers lookup and completion
;; (require 'init-etags-select);;Tags相关，暂时用不到
;; (require 'init-cc-mode);;CC Mode is a powerful package that provides modes for editing C and C-like 
(require 'init-auto-complete) ; after init-yasnippeta to override TAB
;; (require 'init-semantic);;undone不知道干什么用的
;; (require 'init-cmake-mode);;CMake是一个跨平台的安装(编译)工具,可以用简单的语句来描述所有平台的安装(编译过程)
;; (require 'init-csharp-mode)
(require 'init-linum-mode);;显示行号
;; (require 'init-delicious);; 貌似没用;;make startup slow, I don't use delicious in w3m
;; (require 'init-emacs-w3m);;w3m是个开放源代码的文字式网页浏览器，有用吗？
;; (require 'init-eim);;一种内置emacs的中文输入法

(require 'init-thing-edit);;copy and paste;; M-c M-l, M-c M-w, M-c l, M-c w
(require 'init-which-func);;会显示当前形参在minibuf上
(require 'init-keyfreq);;看上去用处不大，可以统计各种命令使用的频率keyfreq-show
(require 'init-gist);;git相关，暂时不知道干什么用的
;; (require 'init-emacspeak);;a complete audio desktop environment for Emacs
;; (require 'init-pomodoro);;番茄钟
(require 'init-undo-tree);;非常有用undo-tree
;; (require 'init-moz);;access and modify Mozilla and Firefox apps from the inside
;; (require 'init-evil) ; use evil mode (vi key binding)
;;(require 'init-misc);;一些杂项，大多数用处不大，如果需要，可以挑选一些加到local里

(require 'init-ctags);;undone but very important
(require 'init-window-numbering);;M-1,2,3,4窗口切换，先C-x 1 最大化窗口，然后C-x 4 u还原窗口操作
(require 'init-iimage-mode)

;;需要研究的
;;(require 'init-nxhtml)
;;(require 'init-Snarl)
;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(defconst --batch-mode (member "--batch-mode" command-line-args)
          "True when running in batch-mode (--batch-mode command-line switch set).")

(unless --batch-mode
  (require 'server)
  (when (and (= emacs-major-version 23)
             (= emacs-minor-version 1)
             (equal window-system 'w32))
    ;; Suppress error "directory ~/.emacs.d/server is unsafe" on Windows.
    (defun server-ensure-safe-dir (dir) "Noop" t))
  (condition-case nil
      (unless (server-running-p) (server-start))
    (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
    (error
     (let* ((server-dir (if server-use-tcp server-auth-dir server-socket-dir)))
       (when (and server-use-tcp
                  (not (file-accessible-directory-p server-dir)))
         (display-warning
          'server (format "Creating %S" server-dir) :warning)
         (make-directory server-dir t)
         (server-start))))))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(if (file-readable-p (expand-file-name "~/.emacs.d/custom.el"))
     (load-file (expand-file-name "~/.emacs.d/custom.el"))
       nil)

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
;(require 'init-locales) ;does not work in cygwin


(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time)))
   )
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
