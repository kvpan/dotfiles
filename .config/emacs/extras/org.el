;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Critical variables
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; You can read the documentation for any variable with `C-h v'.

;; Agenda variables
(setq org-directory "~/Documents/org/prod") 
(setq org-agenda-files '("personal.org" "work.org"))

;; Org-roam variables
(setq org-roam-directory "~/Documents/org/notes/")
(setq org-roam-index-file "~/Documents/org/notes/index.org")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   General config
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :hook ((org-mode . visual-line-mode)  ; wrap lines at word breaks
         (org-mode . flyspell-mode))    ; spell checking!

  :bind (:map global-map
              ("C-c l s" . org-store-link)          ; Mnemonic: link → store
              ("C-c l i" . org-insert-link-global)  ; Mnemonic: link → insert
              ("C-c c" . org-capture)
              ("C-c a" . org-agenda)) 
  :config
  ;; Make org-open-at-point follow file links in the same window
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  ;; Make exporting quotes better
  (setq org-export-with-smart-quotes t)

  ;; Logging options
  (setq org-log-into-drawer "LOGBOOK")
  (setq org-log-reschedule 'note)
  
  ;; Tasks
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "READ(r!)" "WAIT(w@/!)" "WORK(k!)" "|" "DONE(d!)" "VOID(v@/!)")))

  ;; Refile configuration
  (setq org-refile-targets '((org-agenda-files :level . 1)))
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-allow-creating-parent-nodes t)

  ;; Task dependencies
  (setq org-enforce-todo-dependencies t)
  (setq org-enforce-todo-checkbox-dependencies t)
  (setq org-agenda-dim-blocked-tasks t)

  ;; Babel
  (setq org-confirm-babel-evaluate nil)
  
  (setq org-capture-templates
        '(("c" "Default Capture" entry (file "inbox.org")
           "* TODO %^{Title}\n:LOGBOOK:\n- Created: %U\n:END:\n%?")
          ("r" "Capture with Reference" entry (file "inbox.org")
           "* TODO %^{Title}\n:LOGBOOK:\n- Created: %U\n:REFERENCE: %a\n:END:\n%?"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   extensions
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :hook ((org-mode-hook . variable-pitch-mode)
         (org-mode-hook . org-indent-mode))
  :config
  (require 'org-habit)
  (setq org-habit-show-habits-only-for-today t)

  (setq org-adapt-indentation t
        org-hide-leading-stars t
        org-pretty-entities t
	    org-ellipsis "·")

  (setq org-src-fontify-natively t
	    org-src-tab-acts-natively t
        org-edit-src-content-indentation 0))

(use-package org-superstar
  :ensure t
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-headline-bullets-list '("◉" "○" "⚬" "◈" "◇"))
  (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  (setq org-superstar-todo-bullet-alist '(("TODO"  . ?⛶)
                                          ("READ"  . ?⛶)
                                          ("WAIT"  . ?⍰)
                                          ("WORK"  . ?☐)
                                          ("VOID"  . ?☒)
										  ("DONE"  . ?☑)))
  :hook (org-mode . org-superstar-mode))

(use-package org-roam
  :ensure t)
