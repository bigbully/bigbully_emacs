;;http://www.gnu.org/software/emacs/manual/html_node/emacs/Dired.html
(eval-after-load 'dired
  '(progn
     (require 'dired+)
     (setq dired-recursive-deletes 'top)
     (define-key dired-mode-map [mouse-2] 'dired-find-file)))
;;key bind
;;find filename: M-s f C-s
;;mark file to delete: d
;;unmark file: u
;;delete marked file: x
;;mark all # file: #
;;mark all ~ file: ~
;;other window open the file: o
;;all mark with * look at this: http://www.gnu.org/software/emacs/manual/html_node/emacs/Marks-vs-Flags.html#Marks-vs-Flags
;;copy: C
;;rename: r
;;modify mode: M
;;subdirectory: i
;;undo: C-_
;;at subdirectory, prvevious directory: C-M-p
;;next d: C-M-n
;;parent d: C-M-u
;;to the first subdirectory's header line: C-M-d
;;hide subdirectory: $
;;hide all directories: M-$
;;update entire dired buffer: g
(provide 'init-dired)

