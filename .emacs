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
 '(auto-revert-avoid-polling t)
 '(auto-revert-interval 3)
 '(blink-cursor-mode nil)
 '(cider-enrich-classpath t)
 '(cider-font-lock-dynamically '(macro function var deprecated core))
 '(cider-repl-history-file 'per-project)
 '(cider-repl-history-size 1000)
 '(cider-show-error-buffer 'except-in-repl)
 '(cider-use-tooltips nil)
 '(clojure-indent-keyword-style 'align-arguments)
 '(clojure-indent-style 'align-arguments)
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(custom-enabled-themes '(deeper-blue))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fill-column 120)
 '(flx-ido-mode t)
 '(global-auto-revert-mode t)
 '(gptel-use-curl "/opt/homebrew/opt/curl/bin/curl")
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
   '(0blayout amx anakondo ansible browse-at-remote clay clojure-mode clojure-ts-mode colorful-mode company-terraform ct
              deadgrep dockerfile-mode dumb-jump exec-path-from-shell expand-region find-file-in-repository flx-ido
              flycheck-tip flymake-hadolint git-gutter-fringe gptel gptel-magit highlight-parentheses highlight-symbol
              ido-completing-read+ iedit jinja2-mode magit multiple-cursors paredit rainbow-delimiters sqlformat
              swift-mode terraform-mode treesit-fold uniline wgrep wgrep-deadgrep yaml-mode))
 '(ring-bell-function 'ignore)
 '(safe-local-variable-directories '("/Users/kmkoskin/work/proj-endor/backend/"))
 '(safe-local-variable-values
   '((babashka-tasks
      ("bb run fmt:fix" "bb run lint:kondo" "bb run lint:splint" "bb run lint:eastwood" "bb run outdated"
       "bb run poly:test"))
     (cider-shadow-cljs-default-options . "app")))
 '(sh-basic-offset 2)
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
   (fn-traced :defn)
   (rf/reg-event-fx 'defun)
   (rf/reg-event-db 'defun)
   (rf/reg-fx 'defun)
   (rf/reg-sub 'defun))
  (dolist (mode '(enable-paredit-mode
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

(setq gptel-model 'claude-sonnet-4-20250514
      gptel-backend
      (gptel-make-bedrock "AWS"
        :stream t
        :region "eu-west-1"
        ;; subset of gptel--bedrock-models
        :models '(claude-sonnet-4-20250514)
        ;; Model region for cross-region inference profiles. Required for models such
        ;; as Claude without on-demand throughput support. One of 'apac, 'eu or 'us.
        ;; https://docs.aws.amazon.com/bedrock/latest/userguide/inference-profiles-use.html
        :model-region 'eu))

(use-package clay)

(defun json->edn ()
  "Convert the selected region, or entire file, from JSON to EDN."
  (interactive)
  (let ((b (if mark-active (region-beginning) (point-min)))
        (e (if mark-active (region-end) (point-max)))
        (jet (when (executable-find "jet")
               "jet --pretty --keywordize keyword --from json --to edn")))
    (if jet
      (let ((p (point)))
        (shell-command-on-region b e jet (current-buffer) t)
        (goto-char p))
      (user-error "Could not find jet installed"))))

(global-display-line-numbers-mode)

'(setq treesit-language-source-alist
      '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src")))

;; Needs straight.el, doesn't work without it
;; (use-package treesit-fold
;;   :straight (treesit-fold :type git :host github :repo "emacs-tree-sitter/treesit-fold"))

'(use-package treesit
  :mode (("\\.ts\\'" . typescript-ts-mode)))

'(treesit-language-available-p 'js)


(use-package treesit
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.js\\'"  . typescript-ts-mode)
         ("\\.mjs\\'" . typescript-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode)
         ("\\.cjs\\'" . typescript-ts-mode)
         ("\\.ts\\'"  . typescript-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode)
         ("\\.json\\'" .  json-ts-mode)
         ("\\.Dockerfile\\'" . dockerfile-ts-mode)
         ;; More modes defined here...
         )
  :preface
  (defun os/setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.25.0"))
               (bash . ("https://github.com/tree-sitter/tree-sitter-bash" "v0.25.1"))
               (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.23.2"))
               (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.25.0" "src"))
               (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.24.8"))
               (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.25.0"))
               (go "https://github.com/tree-sitter/tree-sitter-go" "v0.25.0")
               (markdown "https://github.com/ikatyang/tree-sitter-markdown")
               (make "https://github.com/alemuller/tree-sitter-make")
               (elisp "https://github.com/Wilfred/tree-sitter-elisp")
               (cmake "https://github.com/uyha/tree-sitter-cmake")
               (c . ("https://github.com/tree-sitter/tree-sitter-c" "v0.24.1"))
               (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.4"))
               (toml "https://github.com/tree-sitter/tree-sitter-toml")
               (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src"))
               (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src"))
               (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))))
      (add-to-list 'treesit-language-source-alist grammar)
      ;; Only install `grammar' if we don't already have it
      ;; installed. However, if you want to *update* a grammar then
      ;; this obviously prevents that from happening.
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))

  ;; Optional, but recommended. Tree-sitter enabled major modes are
  ;; distinct from their ordinary counterparts.
  ;;
  ;; You can remap major modes with `major-mode-remap-alist'. Note
  ;; that this does *not* extend to hooks! Make sure you migrate them
  ;; also
  '(dolist (mapping
            '((python-mode . python-ts-mode)
              (css-mode . css-ts-mode)
              (typescript-mode . typescript-ts-mode)
              (js-mode . typescript-ts-mode)
              (js2-mode . typescript-ts-mode)
              (c-mode . c-ts-mode)
              (c++-mode . c++-ts-mode)
              (c-or-c++-mode . c-or-c++-ts-mode)
              (bash-mode . bash-ts-mode)
              (css-mode . css-ts-mode)
              (json-mode . json-ts-mode)
              (js-json-mode . json-ts-mode)
              (sh-mode . bash-ts-mode)
              (sh-base-mode . bash-ts-mode)))
     (add-to-list 'major-mode-remap-alist mapping))
  :config
  (os/setup-install-grammars))
