;; http://emacswiki.org/emacs/OrgMode
;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
;; http://orgmode.org/org.html
;; http://www.emacswiki.org/emacs/OrgJiraMode
;; ----------------------------
;; keymap:
;; 1.outline
;; tab,S-tab
;; C-c C-n��һ��,  C-c C-p��һ��, C-c C-fͬ������һ��, C-c C-bͬ������һ��, C-c C-u��һ��
;; 2.table
;; C-c | ���ɱ��, C-c C-c ������, tab�����ƶ�, S-tab������,  ret�����ƶ�
;; M-���������ƶ����У�M-S-��������ɾ������������, C-c -���һ�����, C-c +���, S-ret����˳��+1
;; C-c `�༭��Ԫ���ڵ����ԵĴ���,<3>�趨���
;; 3.link
;; [[link][description]], C-c C-l�༭, C-c C-o��ת��
;; [[my-target][find-my-target]] �����ҵ��ڲ���ǩ:* my-target��<<my-target>>.���*my-target,#my-target,my-target
;; [[File:d:/1.txt][1.txt]]������ת���ļ�
;; C-c l �ݴ�һ��location, ��ʹ��C-c C-lʱ�������¼����Բ����ݴ�λ��
;; C-c l������ȫ��ʹ�ã�����ݴ��ļ��Ļ�C-u C-c l���Ա������λ�ã�C-u C-u C-c l���Ա������λ��
;; 4.todo  M-shift-RET TODO
;; �Ѿ���*��ǵ�headline C-c C-t����ѡ��״̬, C-u C-c C-t����ֱ�ӱ��todo��S-�� S-�ҿ���ѡ��
;; C-c / tչ��todo tree�� C-c a tչ��ȫ��todo,  C-3 C-c C-tȡtodo sequence�еĵ�3��
;; S-���� �����ȼ�
;; [/][%]C-c C-c������
;; ��headline��C-c C-c���Լ�tag, C-c \ �������б�ǩ�����㼶��
;; ÿһ��Plain List �������ڿ�ͷ��[ ]Ȼ��C-c C-c���checkbox
;; properties C-c C-x p
;; 5.attachments C-c C-a


;; hit "t" to mark an item DONE, or hit RET to jump to the source file where the TODO is located
;;  C-c C-s to run org-schedule
;;  C-c a a for org-agenda. A display of this week's scheduled items are displayed
;; export to html


(define-key global-map "\C-cl" 'org-store-link)
(global-set-key "\C-c o" 'org-open-at-point-global)
(define-key global-map "\C-ca" 'org-agenda)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;; Various preferences
(setq org-log-done t
      org-completion-use-ido t
      org-startup-indented t;;������԰Ѷ���Ǳ�Ϊһ���Ǽ�����
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

; Refile targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))))
; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))
; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

;; ����todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t@)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . (:foreground "orange" :weight bold)) ("DONE" . (:foreground "green" :weight bold))))


;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; ;; Show iCal calendars in the org agenda
;; (when *is-a-mac*
;;   (eval-after-load "org"
;;     '(if *is-a-mac* (require 'org-mac-iCal)))
;;   (setq org-agenda-include-diary t)
;; 
;;   (setq org-agenda-custom-commands
;;         '(("I" "Import diary from iCal" agenda ""
;;            ((org-agenda-mode-hook
;;              (lambda ()
;;                (org-mac-iCal)))))))
;; 
;;   (add-hook 'org-agenda-cleanup-fancy-diary-hook
;;             (lambda ()
;;               (goto-char (point-min))
;;               (save-excursion
;;                 (while (re-search-forward "^[a-z]" nil t)
;;                   (goto-char (match-beginning 0))
;;                   (insert "0:00-24:00 ")))
;;               (while (re-search-forward "^ [a-z]" nil t)
;;                 (goto-char (match-beginning 0))
;;                 (save-excursion
;;                   (re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
;;                 (insert (match-string 0)))))
;;   )


(eval-after-load 'org
   '(progn
      (require 'org-exp)
      (require 'org-clock)
      ; @see http://irreal.org/blog/?p=671
      (setq org-src-fontify-natively t)
      ;;(require 'org-checklist)
      (require 'org-fstree)
      (setq org-ditaa-jar-path (format "%s%s" (if *cygwin* "c:/cygwin" "")
                                       (expand-file-name "~/.emacs.d/elpa/contrib/scripts/ditaa.jar")) )
      (add-hook 'org-mode-hook 'soft-wrap-lines)
      (defun soft-wrap-lines ()
        "Make lines wrap at window edge and on word boundary,
        in current buffer."
        (interactive)
        (setq truncate-lines nil)
        (setq word-wrap t)
        )
        ))

(add-hook 'org-mode-hook 'inhibit-autopair)

;; �� Emacs Org ֱ����ʾͼƬ�� iimage ģʽ
(auto-image-file-mode t) 

(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))

(provide 'init-org)
