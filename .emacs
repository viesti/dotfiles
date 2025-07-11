(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(eval-when-compile
  (require 'use-package))

;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(amx-mode t)
 '(blink-cursor-mode nil)
 '(cider-enrich-classpath t)
 '(cider-font-lock-dynamically '(macro function var deprecated core))
 '(cider-show-error-buffer 'except-in-repl)
 '(cider-use-tooltips nil)
 '(clojure-indent-style 'always-align)
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(custom-enabled-themes '(deeper-blue))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fill-column 120)
 '(flx-ido-mode t)
 '(ido-create-new-buffer 'always)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(ido-ubiquitous-mode t)
 '(ido-use-filename-at-point 'guess)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(lsp-enable-links t)
 '(lsp-file-watch-ignored-directories
   '("[/\\\\]\\.git\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'" "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'"
     "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'" "[/\\\\]node_modules" "[/\\\\]\\.fslckout\\'"
     "[/\\\\]\\.tox\\'" "[/\\\\]dist\\'" "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'"
     "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.deps\\'"
     "[/\\\\]build-aux\\'" "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'" "[/\\\\]bin/Debug\\'" "[/\\\\]obj\\'"
     "[/\\\\]target\\'" "[/\\\\]\\.clj-kondo\\'" "[/\\\\]\\.shadow-cljs\\'" "[/\\\\]\\.npm-cache\\'"
     "[/\\\\]\\.cljs_node_repl\\'" "[/\\\\]\\.terraform\\'" "[/\\\\]\\.venv\\'" "[/\\\\]app\\'" "[/\\\\]ios\\'"))
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-lens-enable nil)
 '(mouse-drag-copy-region t)
 '(ns-alternate-modifier 'none)
 '(ns-command-modifier 'super)
 '(ns-right-alternate-modifier 'meta)
 '(ns-right-command-modifier 'left)
 '(package-selected-packages
   '(amx anakondo browse-at-remote cider clojure-mode clojure-ts-mode company-terraform deadgrep dockerfile-mode dumb-jump
         exec-path-from-shell expand-region find-file-in-repository flx-ido flycheck-tip flymake-hadolint
         git-gutter-fringe highlight-parentheses highlight-symbol ido-completing-read+ iedit lsp-mode magit
         multiple-cursors paredit rainbow-delimiters sqlformat terraform-mode yaml-mode))
 '(ring-bell-function 'ignore)
 '(safe-local-variable-directories '("/Users/kmkoskin/work/proj-endor/backend/"))
 '(safe-local-variable-values
   '((babashka-tasks
      ("bb run fmt:fix" "bb run lint:kondo" "bb run lint:splint" "bb run lint:eastwood" "bb run outdated"
       "bb run poly:test"))
     (cider-shadow-cljs-default-options . "app")))
 '(show-trailing-whitespace t)
 '(tab-width 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight regular :height 130 :width normal)))))

;; Remove confirmation from up/downcase region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(savehist-mode t)
(pending-delete-mode t)
(delete-selection-mode 1)
(server-mode 1)
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; Temporary file configuration
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; System configuration
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs '("JAVA_HOME" "LANG" "LC_ALL"))
  (set-frame-font "-*-Menlo-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1" nil t))
(when window-system
  (load-theme 'deeper-blue t))

(use-package highlight-symbol
  :config
  (global-set-key (kbd "C-<up>") 'highlight-symbol-prev)
  (global-set-key (kbd "C-<down>") 'highlight-symbol-next))

;; Window sizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; multiple-cursors
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Change Windmove default bindings
(dolist (key '("S-<up>" "S-<down>" "S-<left>" "S-<right>"))
  (global-unset-key (kbd key)))
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<up>") 'windmove-up)

;; Global bindings and editing setup
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key (kbd "C-x f") 'find-file-in-repository)
(global-set-key (kbd "C-z") 'er/expand-region)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C--") 'er/contract-region)
;;(global-set-key (kbd "C-<return>") 'er/contract-region)

(global-set-key (kbd "s-.") #'deadgrep)

(define-key key-translation-map (kbd "<C-mouse-1>") (kbd "<mouse-2>"))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "gls"
        dired-listing-switches "-aBhl --group-directories-first"))

;; sqlformat
(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g" "-L"))

(add-hook 'dockerfile-mode-hook (lambda ()
                                  (flymake-mode t)))
(add-hook 'dockerfile-mode-hook #'flymake-hadolint-setup)

(setq ido-use-faces t)
;;(setq flx-ido-use-faces nil)

(use-package paredit
  :init (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  :config
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  :bind
  ("C-s-<right>" . paredit-forward)
  ("C-s-<left>" . paredit-backward)
  ("C-s-<up>" . paredit-backward-up)
  ("C-s-<right>" . paredit-backward-down))

(use-package dumb-jump)
(use-package iedit)
(use-package rainbow-delimiters)
(use-package git-gutter-fringe)
(use-package highlight-parentheses
  :ensure t)

;; Terraform
(use-package company-terraform
  :ensure t
  :config
  (company-terraform-init))

(use-package terraform-mode
  :ensure t
  :config
  (add-hook 'terraform-mode-hook 'display-line-numbers-mode)
  (add-hook 'terraform-mode-hook 'company-mode))
(add-hook 'terraform-mode-hook #'lsp)

(use-package shell
  :config (add-hook 'shell-mode (lambda () (setq show-trailing-whitespace nil))))

;; Clojure

(use-package clojure-mode
  :mode ("\\.cljc$" . clojurec-mode)
  :config
  (define-clojure-indent
   ;; compojure
   (defroutes 'defun)
   (GET 2)
   (POST 2)
   (PUT 2)
   (DELETE 2)
   (HEAD 2)
   (ANY 2)
   (context 2)
   ;; compojure-api
   (GET* 2)
   (POST* 2)
   ;; midje
   (tabular 'defun)
   ;; jayq
   (let-ajax 'defun)
   ;; om
   (render-state 'defun)
   (init-state 'defun)
   (will-mount 'defun)
   (did-mount 'defun)
   (should-update 'defun)
   (will-receive-props 'defun)
   (will-update 'defun)
   (did-update 'defun)
   (render 'defun)
   (render-state 'defun)
   (display-name 'defun)
   (will-unmount 'defun)
   ;; sablono
   (html 'defun)
   ;; cljs.test
   (async 'defun)
   ;; Riemann
   (streams 'defun)
   (where 'defun)
   (changed-state 'defun)
   (expired 'defun)
   (rollup 'defun)
   (changed 'defun)
   (by 'defun)
   (rate 'defun)
   (with 'defun)
   (timing 'defun)
   ;; mocha-latte + latte-chai
   (describe 'defun)
   (it 'defun)
   (before 'defun)
   (beforeEach 'defun)
   ;; core.match
   (match 'defun)
   ;; others
   (with-additional-middleware 'defun)
   (fn-traced :defn))
  (dolist (mode '(display-line-numbers-mode
                  enable-paredit-mode
                  highlight-parentheses-mode
                  rainbow-delimiters-mode))
    (add-hook 'clojure-mode-hook mode)
    (add-hook 'clojure-ts-mode-hook mode)))

(use-package cider
  :ensure t
  :config
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'highlight-parentheses-mode)
  (add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'subword-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook (lambda () (setq show-trailing-whitespace nil))))

(eval-after-load 'cider
  '(let ((reloaded-reset (lambda ()
                           (interactive)
                           (save-some-buffers)
                           (with-current-buffer (cider-current-repl-buffer)
                             (cider-interactive-eval
                              "(integrant.repl/reset)")))))
     (define-key cider-mode-map (kbd "C-'") reloaded-reset)
     (define-key clojure-mode-map (kbd "C-'") reloaded-reset)))

(use-package anakondo
  :ensure t
  :commands anakondo-minor-mode
  :config
  (add-hook 'clojurescript-mode-hook #'anakondo-minor-mode))

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         (clojure-ts-clojurescript-mode . lsp))
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  (setenv "PATH" (concat
                  "/usr/local/bin" path-separator
                  (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  (add-hook 'terraform-mode-hook #'lsp))
