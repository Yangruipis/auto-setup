;; Author: rui.yang1
;; A tiny emacs setting for now window use: -nw


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold 100000000)

;; PACKAGES need to be installed firstly
;; package-refresh-contents
;; - neotree
;; - ace-jump-mode
;; - nyan-mode
;; - all-the-icons
;; - ac-helm
;; - figlet
;; - elpy
;; - flycheck
;; - company-jedi
;; - jedi
;; - neotree
;; - sphinx-frontend
;; - sphinx-mode
;; - flycheck-pyflakes
;; - virtualenvwrapper
;; - virtualenv
;; - company
;; - pylint


(require 'package)
(require 'company)
(require 'counsel)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-j") 'counsel-company)
     (define-key company-active-map (kbd "M-j") 'counsel-company)))


;; 必须放在上面才会生效
;; (global-company-mode); 全局开启
(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 2; 开始补全字数
      company-show-numbers t; 显示序号
      )
(add-hook 'after-init-hook 'global-company-mode)

;; for emacs version < 26.3 bug
(setq package-check-signature nil)

;;; Standard package repositories
;; We include the org repository for completeness, but don't normally
;; use it.
(add-to-list 'package-archives '("org" . "http://elpa.emacs-china.org/gnu/"))

;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))


(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)


;; 用C-<tab> 作为窗口切换按键
(global-set-key [C-tab] 'ace-window)
;; use ibuffer instead of buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [remap list-buffers] 'ibuffer)


;; share the clipboard with the X-window
(setq x-select-enable-clipboard t)

(defun copy-to-clipboard ()
  "Copies selection to x-clipboard."
  (interactive)
  (if (display-graphic-p)
      (progn
	(message "Yanked region to x-clipboard!")
	(call-interactively 'clipboard-kill-ring-save)
	)
    (if (region-active-p)
	(progn
	  ;; (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
	  (shell-command-on-region (region-beginning) (region-end) "nc -q0 localhost 5556")
	  (message "Yanked region to clipboard!")
	  (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  "Pastes from x-clipboard."
  (interactive)
  (if (display-graphic-p)
      (progn
	(clipboard-yank)
	(message "graphics active")
	)
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )
(global-set-key (kbd "C-M-w") 'copy-to-clipboard)
(setq ediff-split-window-function 'split-window-horizontally)


;; neo-tree
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key (kbd "C-c n") 'neotree-projectile-action)
(global-set-key (kbd "C-c M-n") 'neotree-toggle)
;; run all-the-icons-install-fonts firstly
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; ace-jump
(global-set-key (kbd "M-p") 'ace-jump-mode)
;; winner mode
(winner-mode)
(global-set-key (kbd "C-x p") 'winner-undo)
(global-set-key (kbd "C-x n") 'winner-redo)
;; nyan-cat
(nyan-mode)
(nyan-start-animation)
;; helm
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
;; make helm complete after [TAB]
(with-eval-after-load 'helm
  (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  )

;; ;; deprecated
;; elpy python 前端
;; (require 'elpy)
;; (elpy-enable)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;                                 JEDI                                   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; enable elpy jedi backend
;; 使用 jedi 后端补全
;; (setq elpy-rpc-backend "jedi")
;; (add-to-list 'company-backends 'company-jedi)


;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:use-shortcuts t)
;; (global-set-key (kbd "M-.") 'jedi:goto-definition)
;; (add-hook 'python-mode-hook (lambda () (company-mode -1)))


;; (setq jedi:environment-root "jedi")  ; or any other name you like
;; (setq jedi:environment-virtualenv
;;       (append python-environment-virtualenv
;;	      '("--python" "/home/ryang/anaconda3/envs/py3_gnn/bin/python")))


;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;                          CONDA & company                               ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (eval-after-load "company"
;;    '(add-to-list 'company-backends '(company-anaconda :with company-dabbrev-code)))
(eval-after-load "company"
   '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)

;; 用于当光标在函数括号内时，在底部显示参数介绍
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; (advice-add 'company-complete-common :before (lambda ()
;;					       (setq my-company-point (point))))
;; (advice-add 'company-complete-common :after (lambda ()
;;					      (when (equal my-company-point (point)) (yas-expand))))

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; company-tabnine
;; (require 'company-tabnine)
;; (add-to-list 'company-backends #'company-tabnine)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; indent highlight
(add-hook 'python-mode-hook 'highlight-indentation-mode)
;;(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)


;; 使用 yapf 进行format
;; (require 'py-yapf)
;; (add-hook 'python-mode-hook 'py-yapf-enable-on-save)


;; 使用 flycheck+flake8 语法检查
(require 'flycheck)
(add-hook 'python-mode-hook 'flycheck-mode)


;; sphinx-doc
;; python 注释自动生成
(require 'sphinx-doc)
(add-hook 'python-mode-hook (lambda ()
			      (require 'sphinx-doc)
			      (sphinx-doc-mode t)))


;; 正规的 undo redo | 通过 C-x u 可视化查看
;; (add-to-list 'load-path "~/.emacs.d/elpa/undo_tree/")
;; (load "undo-tree.el")
(require 'undo-tree)
(global-undo-tree-mode)


;; 正规的 undo redo | 通过 C-x u 可视化查看
;; (add-to-list 'load-path "~/.emacs.d/custom/prototxt")
;; (load "prototxt-mode.el")
;; (require 'prototxt-mode)
;; (add-hook 'prototxt-mode-hook
;;	  (lambda()
;;	    (setq prototxt-mode-indentation-level 4)))  ;; use 4-space indentation


;; clang-format
(require 'clang-format)
(add-hook 'c++-mode-hook
       (lambda ()
	(local-set-key (kbd "C-c i") 'clang-format-buffer)))

(setq clang-format-style-option "file")
;; (setq clang-format-style-option "{BasedOnStyle: LLVM, IndentWidth: 4, BreakBeforeBraces: Allman, UseTab: Never, ColumnLimit: 115, Standard: Cpp03, BinPackArguments: false, BinPackParameters: false, AccessModifierOffset: -4}")


;; (add-to-list 'load-path "/home/ryang/.emacs.d/elpa/py-isort/")
(require 'py-isort)
;; (add-hook 'before-save-hook 'py-isort-before-save)


;; thrift-mode
(require 'thrift)
(add-hook 'thrift-mode-hook 'thrift-mode)
(setq thrift-indent-level 4)

;; get filename
(defun show-file-name ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
		      default-directory
		    (buffer-file-name))))
    (when filename
      (with-temp-buffer
	(insert filename)
	(clipboard-kill-region (point-min) (point-max))
	)
      ;; to xsel
      (with-temp-buffer
	(insert filename)
	;; (shell-command-on-region (point-min) (point-max) "xsel -i -b")
	(shell-command-on-region (point-min) (point-max) "nc -q0 localhost 5556")
	)
      (message filename))))


(global-set-key (kbd "M-m") 'show-file-name)


;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; snippet 由于和 company TAB 冲突，替换 M-f3 为 snippet 展开
(global-set-key (kbd "M-/") (quote yas-expand))


;; swiper
(require 'swiper)
(require 'find-file-in-project)
(global-set-key "\C-s" 'swiper-isearch)
(global-set-key "\C-r" 'swiper-isearch-backward)
(global-set-key (kbd "\C-c s") 'swiper-all)		       ;; 'S'wiper all
(global-set-key (kbd "\C-c o") 'swiper-isearch-thing-at-point) ;; search at 'P'oint
;; use rgrep 如果指定文件后缀
(global-set-key (kbd "\C-c a") 'helm-do-grep-ag) ;; 'A'g
(global-set-key (kbd "\C-c f") 'ffip)            ;; find 'F'ile


;; ;; semantic-mode-hook
;; (semantic-mode 1)
;; (remove-hook 'completion-at-point-functions
;;	     'semantic-analyze-completion-at-point-function)
;; (remove-hook 'completion-at-point-functions
;;	     'semantic-analyze-notc-completion-at-point-function)
;; (remove-hook 'completion-at-point-functions
;;	     'semantic-analyze-nolongprefix-completion-at-point-function)
;; (add-hook 'c++-mode-hook 'semantic-mode)


;; imenu
(global-set-key (kbd "\C-c m") 'helm-imenu)
(global-set-key (kbd "\C-c \C-m") 'helm-imenu-in-all-buffers)


;; ;; company-backend try hard
;; (add-to-list 'load-path "/home/ryang/.emacs.d/elpa/company-try-hard/")
;; (require 'company-try-hard)
;; (global-set-key (kbd "C-M-j") #'company-try-hard)


;; ;; company-ficus
;; (add-to-list 'load-path "/home/ryang/.emacs.d/private/module/")
;; (add-to-list 'company-backends 'company-ficus)


;; autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers


;; highlight-parentheses
(require 'highlight-parentheses)
(add-hook 'python-mode-hook 'highlight-parentheses-mode)
(add-hook 'c++-mode-hook 'highlight-parentheses-mode)
(add-hook 'shell-mode-hook 'highlight-parentheses-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
(show-paren-mode 1)


;; ;; blacken
;; (add-hook 'python-mode-hook 'blacken-mode)


;; ;; large file
;; (require 'vlf-setup)
;; (require 'vlf)
;; (defun my-find-file-check-make-large-file-read-only-hook ()
;;   "If a file is over a given size, make the buffer read only."
;;   (when (> (buffer-size) (* 1024 1024))
;;     (setq buffer-read-only t)
;;     (buffer-disable-undo)
;;     (vlf-mode)))
;; (add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;; spaceline
(require 'spaceline-config)
(spaceline-emacs-theme)
(spaceline-helm-mode 1)

;; hide toobar
(menu-bar-mode -1)

;; json mode & expand
;; https://github.com/joshwnj/json-mode
(require 'yafolding)
(global-set-key (kbd "C-c -") 'yafolding-hide-element)
(global-set-key (kbd "C-c =") 'yafolding-toggle-element)

;; copy & paste
(global-set-key (kbd "C-c v") 'paste-from-clipboard)

;; clean-aindent-mode
;; (add-to-list 'load-path "/home/ryang/.emacs.d/elpa/clean-aindent-mode/")
(require 'clean-aindent-mode)
(define-key global-map (kbd "RET") 'newline-and-indent)
(set 'clean-aindent-is-simple-indent t)

;; 和campany冲突
;; (add-to-list 'load-path "/home/ryang/.emacs.d/elpa/nlinum-mode/")
;; (require 'nlinum)
;; (setq nlinum-highlight-current-line t)
;; (global-nlinum-mode)

(defun sh-format ()
  "format sh file"
  (interactive)
  (if (display-graphic-p)
      (progn
	(message "format sh file succ!")
	)
    (if (region-active-p)
	(progn
	  (replace-string " --" " \\
\t\t--" nil (region-beginning) (region-end) nil)
	  (message "format sh file succ!")
	  (deactivate-mark))
      (message "No region active; can't format sh!")))
  )

(add-hook 'sh-mode-hook
       (lambda ()
	 (local-set-key (kbd "C-c i") 'sh-format)))

;; ipython
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=Linux --profile=default --simple-prompt"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; counsel-etags
(add-to-list 'load-path "/root/git_repos/auto-setup/emacs_config/elpa/counsel-etags-1.9.11/")
(add-hook 'c++-mode-hook
       (lambda ()
	 (local-set-key (kbd "M-.") 'counsel-etags-find-tag-at-point)))

(global-auto-revert-mode)
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))
(setq package-check-signature nil)

(add-hook 'go-mode-hook
       (lambda ()
	 (local-set-key (kbd "M-.") 'counsel-etags-find-tag-at-point)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-anaconda company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		   (company-dabbrev-code company-gtags company-etags company-keywords)
		   company-oddmuse company-dabbrev)))
 '(package-selected-packages
   (quote
    (%PACKAGES%))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
