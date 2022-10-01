;;; Emacs --- .emacs
;;; Commentary:
;;; Emacs configuration
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
;;; Code:
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; (lsp-file-watch-ignored-directories
;;   '("[/\\\\]\\.git\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'" "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'" "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'" "[/\\\\]node_modules" "[/\\\\]\\.fslckout\\'" "[/\\\\]\\.tox\\'" "[/\\\\]dist\\'" "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'" "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.deps\\'" "[/\\\\]build-aux\\'" "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'" "[/\\\\]bin/Debug\\'" "[/\\\\]obj\\'" "node_modules" "target" "\\.shadow-cljs"))

(eval-when-compile
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   '(emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode))
 '(ag-highlight-search t)
 '(ag-reuse-buffers nil)
 '(ag-reuse-window nil)
 '(auto-revert-interval 2)
 '(blink-cursor-mode nil)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(cider-auto-select-error-buffer nil)
 '(cider-font-lock-dynamically '(macro function var deprecated core))
 '(cider-popup-on-error t)
 '(cider-popup-stacktraces t)
 '(cider-prompt-for-symbol nil)
 '(cider-repl-history-file "~/.emacs.d/nrepl-history.log")
 '(cider-show-error-buffer 'except-in-repl)
 '(cljr-cljc-clojure-test-declaration
   "#?(:clj [clojure.test :refer [deftest is]]
:cljs [cljs.test :as t :include-macros true])")
 '(cljr-clojure-test-declaration "[clojure.test :refer [deftest is]]")
 '(clojure-indent-style 'align-arguments)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))
 '(european-calendar-style t)
 '(fill-column 120)
 '(flycheck-disabled-checkers '(javascript-jshint sh-bash))
 '(ggtags-global-abbreviate-filename nil)
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(idle-highlight-idle-time 0.1)
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(ido-use-filename-at-point 'guess)
 '(indent-tabs-mode nil)
 '(inferior-js-program-command "/usr/local/bin/phantomjs")
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-screen t)
 '(jedi:complete-on-dot t)
 '(jedi:install-imenu nil)
 '(js-chain-indent nil)
 '(js-expr-indent-offset 0)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(large-file-warning-threshold nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-file-watch-ignored-directories
   '("[/\\\\]\\.git\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'" "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'" "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'" "[/\\\\]node_modules" "[/\\\\]\\.fslckout\\'" "[/\\\\]\\.tox\\'" "[/\\\\]dist\\'" "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'" "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.deps\\'" "[/\\\\]build-aux\\'" "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'" "[/\\\\]bin/Debug\\'" "[/\\\\]obj\\'" "[/\\\\]target\\'" "[/\\\\]\\.clj-kondo\\'" "[/\\\\]\\.shadow-cljs\\'" "[/\\\\]\\.npm-cache\\'" "[/\\\\]\\.cljs_node_repl\\'" "[/\\\\]\\.terraform\\'"))
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-lens-enable nil)
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-doc-position 'bottom)
 '(lsp-ui-doc-show-with-cursor nil)
 '(lsp-ui-sideline-show-code-actions nil)
 '(lsp-ui-sideline-show-diagnostics nil)
 '(lsp-ui-sideline-show-hover nil)
 '(lsp-ui-sideline-show-symbol nil)
 '(mac-font-panel-mode nil)
 '(magit-diff-refine-hunk 'all)
 '(magit-use-overlays t)
 '(mark-diary-entries-in-calendar t)
 '(mc/always-repeat-command t)
 '(moom-use-font-module nil)
 '(mouse-drag-copy-region t)
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-wheel-progressive-speed nil)
 '(ns-alternate-modifier 'none)
 '(ns-command-modifier 'super)
 '(ns-right-alternate-modifier 'meta)
 '(ns-right-command-modifier 'left)
 '(number-of-diary-entries 3)
 '(package-selected-packages
   '(lsp-mode lsp-ui typescript-mode flymake-hadolint a docker-compose-mode flx-isearch keytar moom sqlformat inf-clojure treemacs zprint-mode csv-mode flycheck-plantuml go-mode js-doc docker dired-sidebar calfw-ical dockerfile-mode ess dash-at-point graphviz-dot-mode groovy-mode which-key starter-kit smex python-environment pkg-info peg paredit nose multiple-cursors json-reformat js2-mode idle-highlight-mode helm-core helm git-gutter fringe-helper flymake-easy es-windows es-lib epl epc edn direx deferred concurrent color-theme writegood-mode web-beautify starter-kit-lisp starter-kit-eshell starter-kit-bindings sr-speedbar smartparens slamhound request project-explorer php-mode nose-mode nlinum nginx-mode newlisp-mode mo-git-blame midje-mode markdown-mode magit-find-file levenshtein less-css-mode latest-clojure-libraries jump-char js2-closure jedi-direx javap-mode highlight-symbol highlight-parentheses helm-cmd-t guile-scheme gtags gitconfig ggtags flymake-json flymake-jshint flx-ido etags-table etags-select epoch-view ensime cycbuf command-t color-theme-solarized color-theme-github clojurescript-mode cljdoc buffer-move anyins ace-jump-mode ac-ispell))
 '(python-shell-interpreter "python")
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values
   '((cider-shadow-cljs-default-options . "app")
     (cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend")
     (cider-cljs-lein-repl . "(do (dev) (go) (cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")
     (whitespace-line-column . 80)
     (lexical-binding . t)))
 '(savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
 '(savehist-file "~/.emacs.d/savehist")
 '(scroll-bar-mode 'right)
 '(sgml-basic-offset 4)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(speedbar-default-position 'left)
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(view-diary-entries-initially t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "magenta" :weight bold)))))

(font-lock-add-keywords nil
                        '(("\\<\\(FIXME\\|TODO\\)"
                           1 font-lock-warning-face prepend)))

;; (require 'use-package-ensure)
;; (setq use-package-always-ensure t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
(require 'amx)
(amx-mode 1)
(require 'icomplete)
(icomplete-mode 1)

(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(use-package dumb-jump)

(use-package groovy-mode
  :mode
  ("\\.groovy$" . groovy-mode)
  ("\\.jenkins$" . groovy-mode)
  :interpreter "groovy")

(use-package smartparens-config)

(use-package cc-mode
  :config
  (add-hook 'c-mode-hook 'imenu-add-menubar-index)
  (add-hook 'c-mode-hook 'display-line-numbers-mode)
  (add-hook 'c-mode-hook (lambda () (smartparens-mode 1)))
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1)))))

(use-package flycheck
  :config
  (global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode))

;;(flycheck-add-mode 'javascript-eslint 'web-mode)
;;(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

(use-package flymake-jshint
  :config (add-hook 'js-mode-hook 'flymake-mode))

(require 'flymake-json)
(add-hook 'json-mode 'flymake-json-load)
(require 'flymake-eslint)
(add-hook 'rjsx-mode-hook
          (lambda ()
            (flymake-eslint-enable)))

(use-package rjsx-mode
  :mode
  ("\\.jsx$" . rjsx-mode))

(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (add-hook 'js2-mode-hook #'add-node-modules-path)
  (add-hook 'js2-mode-hook 'display-line-numbers-mode)
  (add-hook 'js2-mode-hook
            '(lambda ()
               (local-set-key "\C-x\C-e" 'js-send-last-sexp)
               (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
               (local-set-key "\C-cb" 'js-send-buffer)
               (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
               (local-set-key "\C-cl" 'js-load-file-and-go))))

;; Make indentation to be 4 spaces: https://stackoverflow.com/a/10999014
(require 'cl)

(eval-after-load "js" '(defun js--proper-indentation (parse-status)
 "Return the proper indentation for the current line."
 (save-excursion
   (back-to-indentation)
   (cond ((nth 4 parse-status)
          (js--get-c-offset 'c (nth 8 parse-status)))
         ((nth 8 parse-status) 0) ; inside string
         ((js--ctrl-statement-indentation))
         ((eq (char-after) ?#) 0)
         ((save-excursion (js--beginning-of-macro)) 4)
         ((nth 1 parse-status)
       ;; A single closing paren/bracket should be indented at the
       ;; same level as the opening statement. Same goes for
       ;; "case" and "default".
          (let ((same-indent-p (looking-at
                                "[]})]\\|\\_<case\\_>\\|\\_<default\\_>"))
                (continued-expr-p (js--continued-expression-p)))
            (goto-char (nth 1 parse-status)) ; go to the opening char
            (if (looking-at "[({[]\\s-*\\(/[/*]\\|$\\)")
                (progn ; nothing following the opening paren/bracket
                  (skip-syntax-backward " ")
                  (when (eq (char-before) ?\)) (backward-list))
                  (back-to-indentation)
                  (cond (same-indent-p
                         (current-column))
                        (continued-expr-p
                         (+ (current-column) (* 2 js-indent-level)
                            js-expr-indent-offset))
                        (t
                         (+ (current-column) js-indent-level
                            (case (char-after (nth 1 parse-status))
                              (?\( js-paren-indent-offset)
                              (?\[ js-square-indent-offset)
                              (?\{ js-curly-indent-offset))))))
              ;; If there is something following the opening
              ;; paren/bracket, everything else should be indented at
              ;; the same level.

      ;; Modified code here:
              (unless same-indent-p
                (move-beginning-of-line 1)
                (forward-char 4))
      ;; End modified code
              (current-column))))

         ((js--continued-expression-p)
          (+ js-indent-level js-expr-indent-offset))
         (t 0))))  )

(use-package highlight-symbol
  :config
  (global-set-key (kbd "C-<up>") 'highlight-symbol-prev)
  (global-set-key (kbd "C-<down>") 'highlight-symbol-next))

(use-package paredit
  :init (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  :config
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  :bind
  ("C-s-<right>" . paredit-forward)
  ("C-s-<left>" . paredit-backward)
  ("C-s-<up>" . paredit-backward-up)
  ("C-s-<right>" . paredit-backward-down)
  ;; :bind (((kbd "<C-s-right>") . 'paredit-forward)
  ;;        ((kbd "<C-s-left>") . 'paredit-backward)
  ;;        ((kbd "<C-s-up>") . 'paredit-backward-up)
  ;;        ((kbd "<C-s-down>") . 'paredit-backward-down))
  )

(require 'eldoc) ; if not already loaded
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(use-package jedi)

(use-package python
  :config
  (add-hook 'python-mode-hook 'display-line-numbers-mode)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'inferior-python-mode (lambda () (setq show-trailing-whitespace nil))))

(use-package js
  :config (add-hook 'js-mode-hook 'display-line-numbers-mode))

(use-package iedit)

(use-package auto-complete-config
  :config (ac-config-default))

(use-package lua-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(use-package rainbow-delimiters)

(use-package  git-gutter-fringe)

(use-package project-explorer)

(use-package newlisp-mode
  :mode ("\\.lsp$" . newlisp-mode)
  :interpreter "newlisp")
;;(autoload 'newlisp-mode "newlisp-mode" "Major mode for newLISP files." t)
;;(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))
;;(add-to-list 'interpreter-mode-alist '("newlisp" . newlisp-mode))

(use-package ensime
  :config (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(use-package highlight-parentheses)

(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))

(use-package shell
  :config (add-hook 'shell-mode (lambda () (setq show-trailing-whitespace nil))))

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package company-terraform
  :config
  (company-terraform-init))

(use-package terraform-mode
  :config
  (add-hook 'terraform-mode-hook 'display-line-numbers-mode)
  (add-hook 'terraform-mode-hook 'company-mode))

(use-package anakondo
  :ensure t
  :commands anakondo-minor-mode
  :config
  (add-hook 'clojurescript-mode-hook #'anakondo-minor-mode))

(use-package clojure-essential-ref
  :ensure t)

;; Remove confirmation from up/downcase region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Global bindings and editing setup
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key (kbd "C-x f") 'find-file-in-repository)
(global-set-key (kbd "C-z") 'er/expand-region)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C--") 'er/contract-region)
;;(global-set-key (kbd "C-<return>") 'er/contract-region)
(pending-delete-mode t)
(delete-selection-mode 1)
(menu-bar-mode 1)

;; (mapc 'global-unset-key (list (kbd "<C-s-up>") (kbd "<C-s-down>")(kbd "<C-s-right>")(kbd "<C-s-left>")))
;; (global-set-key (kbd "<C-s-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-s-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-s-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-s-right>")  'buf-move-right)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-unset-key (kbd "s-,"))
(global-set-key (kbd "C-g") 'keyboard-quit)

;; Change Windmove default bindings
(dolist (key '("S-<up>" "S-<down>" "S-<left>" "S-<right>"))
  (global-unset-key (kbd key)))
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<up>") 'windmove-up)

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

(savehist-mode t)
(put 'narrow-to-region 'disabled nil)
(server-mode 1)
(electric-indent-mode +1)

;; System configuration
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs '("JAVA_HOME" "LANG" "LC_ALL"))
  (set-frame-font "-*-Menlo-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1" nil t))
(when window-system
  (load-theme 'deeper-blue t))

(defun clojure-config ()
  "Clojure configuration."
  (use-package flycheck-clj-kondo)
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
    (add-hook 'clojure-mode-hook 'display-line-numbers-mode)
    (add-hook 'clojure-mode-hook 'yas-minor-mode)
    (add-hook 'clojure-mode-hook #'enable-paredit-mode))

  (use-package cider
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
  ;;(setq cider-font-lock-dynamically '(macro core function var))
  ;; (add-hook 'clojure-mode-hook (lambda () (yas-minor-mode 1)))


  ;(add-hook 'cider-mode-hook 'cider-profile-mode)
  ;(add-hook 'cider-repl-mode-hook 'cider-profile-mode)
  ;(add-to-list 'auto-mode-alist '("\.cljc$" . clojure-mode))

  ;; (setq cider-prompt-save-file-on-load nil)
  ;(eval-after-load 'flycheck '(flycheck-clojure-setup))
  (eval-after-load 'cider
    '(let ((reloaded-reset (lambda ()
                            (interactive)
                            (save-some-buffers)
                            (with-current-buffer (cider-current-repl-buffer)
                              (cider-interactive-eval
                               "(integrant.repl/reset)")))))
       (setq cider-enrich-classpath t)
       (define-key cider-mode-map (kbd "C-'") reloaded-reset)
       (define-key clojure-mode-map (kbd "C-'") reloaded-reset)))

  (use-package kaocha-runner
    :init
    (bind-keys :prefix-map ar-emacs-kaocha-prefix-map
               :prefix "C-c k"
               ("t" . kaocha-runner-run-test-at-point)
               ("r" . kaocha-runner-run-tests)
               ("a" . kaocha-runner-run-all-tests)
               ("w" . kaocha-runner-show-warnings)
               ("h" . kaocha-runner-hide-windows)))

  (use-package lsp-mode
    :ensure t
    :hook ((clojure-mode . lsp)
           (clojurec-mode . lsp)
           (clojurescript-mode . lsp))
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
    ;;(local-set-key (kbd "C-<up>") 'lsp-ui-find-prev-reference)
    ;;(local-set-key (kbd "C-<down>") 'lsp-ui-find-next-reference)
    ;;(setq lsp-clojure-server-command '("bash" "-c" "clojure-lsp"))
    (setq gc-cons-threshold 100000000
          lsp-enable-indentation nil)
    ;; 1mb
    (setq read-process-output-max (* 1024 1024))

    ;; (lsp-register-client
    ;;  (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve" "-log-file=/tmp/terraform-ls-{{pid}}.log"))
    ;;                   :major-modes '(terraform-mode)
    ;;                   :server-id 'terraform-ls))

    (add-hook 'terraform-mode-hook #'lsp)
    )

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)

  (use-package company-lsp
    :ensure t
    :commands company-lsp))

(clojure-config)

(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-local-dictionary-alist '(("finnish"
                                       "[%.0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[^.%0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[':]"
                                       nil
                                       ("--dict-dir"
                                        ;;"/Library/Application Support/cocoAspell/aspell6-fi-0.7-0"
                                        "/usr/local/Cellar/aspell/0.60.7/lib/aspell-0.60"
                                        "-d" "finnish" )
                                       nil
                                       utf-8)
                                      ("english"
                                       "[A-Za-z]"
                                       "[^A-Za-z]"
                                       "[']"
                                       nil
                                       ("--dict-dir"
                                        ;;"/Library/Application Support/cocoAspell/aspell6-en-7.1-0"
                                        "/usr/local/Cellar/aspell/0.60.7/lib/aspell-0.60"
                                        "-d" "english" )
                                       nil
                                       utf-8)))

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent \"yes-or-no-p\" from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent \"y-or-n-p\" from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))

(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

;;(load-file ".emacs.d/emacs-vega-view/vega-view.el")
;;(add-to-list 'load-path "~/.emacs.d/lisp/emacs-vega-view")
(add-to-list 'load-path "~/.emacs.d/lisp/csv-mode-1.12")
(add-to-list 'load-path "~/.emacs.d/lisp/cljstyle-mode")

(customize-set-variable 'jdecomp-decompiler-paths
                        '((fernflower . "~/bin/fernflower.jar")))
(customize-set-variable 'jdecomp-decompiler-type 'fernflower)

(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "s-.") #'deadgrep)

;;(setq dired-listing-switches "-alhrt")
(add-to-list 'ido-read-file-name-non-ido 'dired-create-directory)
(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first"))

;; tmate.io
(defadvice terminal-init-screen
    ;; The advice is named `tmux', and is run before `terminal-init-screen' runs.
    (before tmux activate)
  ;; Docstring.  This describes the advice and is made available inside emacs;
  ;; for example when doing C-h f terminal-init-screen RET
  "Apply xterm keymap, allowing use of keys passed through tmux."
  ;; This is the elisp code that is run before `terminal-init-screen'.
  (if (getenv "TMUX")
      (let ((map (copy-keymap xterm-function-map)))
        (set-keymap-parent map (keymap-parent input-decode-map))
        (set-keymap-parent input-decode-map map)
        (define-key map "^[[A"  (kbd "<s-up>")))))

 ;; TERMINAL MAPPINGS TO SUPPORT ITERM2 FOR MAC
(progn
  (let ((map (if (boundp 'input-decode-map)
                 input-decode-map
               function-key-map)))
    (define-key map "\e^[[A"  (kbd "<s-up>"))))


;; sqlformat
(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g" "-L"))

(add-hook 'terraform-mode-hook #'lsp)

;;(setq ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-cd-selected)
(setq ivy-use-selectable-prompt t)

;; org mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-publish-project-alist
      '(("quuppa"
         :base-directory "~/work/quuppa"
         :publishing-directory "~/work/quuppa/org-public")))

(defun nomis/lsp-eldoc ()
  ;; Don't blat signatures from CIDER.
  (unless (ignore-errors (cider-repls))
    (lsp-hover))
  )

(setq lsp-eldoc-hook '(nomis/lsp-eldoc))
;; Does not work to disable lsp eldoc competing with cider eldoc
;; (setq lsp-enable-xref t)

;; Grammarly lsp support on markdown buffers
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(markdown-mode . "grammarly"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("unofficial-grammarly-language-server" "--stdio"))
                    :activation-fn (lsp-activate-on "grammarly")
                    :server-id 'grammarly))

  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve" "-log-file=/tmp/terraform-ls-{{pid}}.log"))
  ;;                   :major-modes '(terraform-mode)
  ;;                   :server-id 'terraform-ls))

  )

(with-eval-after-load "moom"
  ;; add settings here ...
  (moom-mode 1))

(add-hook 'dockerfile-mode-hook (lambda ()
                                  (flymake-mode t)))
(add-hook 'dockerfile-mode-hook #'flymake-hadolint-setup)

(setq lsp-disabled-clients '(tfls))

(provide 'emacs)
;;; .emacs ends here
