(prelude-require-packages '(motion-mode rinari))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2))

(add-hook 'web-mode-hook 'web-mode-hook)


(setq js-indent-level 2)

;; (setq x-select-enable-clipboard t)

;; (load-file "~/.emacs.d/personal/pbcopy.el")
;; (require 'pbcopy)
;; (turn-on-pbcopy)

;; (shell-command-on-region (region-beginning) (region-end) "pbcopy")

;; TODO Please improve this
;; (defun copy-from-osx ()
;;   (shell-command-to-string "pbpaste"))

;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil))
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
       (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;; (global-set-key (kbd "C-M-;") 'comment-or-uncomment-region)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; (global-unset-key (kbd "C-/"))
;; (global-set-key (kbd "C-/") 'toggle-comment-on-line)

;; For easy window scrolling up and down.
(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "<f1>") 'multi-term-dedicated-toggle) ; open/close "main" terminal
(custom-set-variables '(coffee-tab-width 2))

;; my key-chord configurations
(key-chord-mode 1)
(key-chord-define-global ",."     "<>\C-b")
(key-chord-define-global "4r"     "$")
(key-chord-define-global "()"     "()\C-b")
(key-chord-define-global "{}"     "{\n\n}\C-p\t")


;; motion-mode
(require 'motion-mode)
(add-hook 'ruby-mode-hook 'motion-recognize-project)

(define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
(define-key motion-mode-map (kbd "C-c C-d") (lambda () (interactive) (motion-execute-rake-command "device")))
(define-key motion-mode-map (kbd "C-c C-o") 'motion-dash-at-point)
(define-key motion-mode-map (kbd "C-c C-p") 'motion-convert-code-region)

;;; custom.el ends here
