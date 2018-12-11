(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/monroe/")
(when (file-exists-p "~/.emacs.d/refresh-packages-on-start")
  (package-refresh-contents))
(mapc 'package-install '(ac-ispell ace-jump-mode ag anyins async auto-complete buffer-move cedit cider cljdoc clojure-cheatsheet clojure-mode clojure-mode-extra-font-locking clojurescript-mode color-theme color-theme-github color-theme-solarized command-t company concurrent ctable cycbuf dash deferred direx ecb edn elisp-slime-nav ensime epc epl epoch-view es-lib es-windows etags-select etags-table eval-sexp-fu exec-path-from-shell expand-region find-file-in-project find-file-in-repository flx flx-ido flymake-easy flymake-jshint free-keys fringe-helper ggtags mo-git-blame git-commit git-gutter git-gutter-fringe gitconfig gtags guile-scheme helm helm-cmd-t helm-core highlight highlight-parentheses highlight-symbol hy-mode hydra icicles idle-highlight-mode ido-completing-read+ ido-ubiquitous iedit isearch+ javap-mode jedi jedi-core jedi-direx js-comint js2-closure js2-mode js2-refactor js3-mode json-mode json-reformat json-snatcher jsx-mode jump-char latest-clojure-libraries less-css-mode levenshtein lua-mode magit magit-find-file magit-popup markdown-mode midje-mode multiple-cursors newlisp-mode nginx-mode nlinum nose nose-mode occur-context-resize paredit peg php-mode pkg-info popup popwin project-explorer python-environment queue rainbow-delimiters request s sbt-mode scala-mode slamhound smartparens smex spinner sr-speedbar starter-kit starter-kit-bindings starter-kit-eshell starter-kit-lisp typed-clojure-mode web-beautify wgrep wgrep-ag with-editor writegood-mode yaml-mode yasnippet flymake-json))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)))
 '(ag-highlight-search t)
 '(ag-reuse-buffers nil)
 '(ag-reuse-window nil)
 '(auto-revert-interval 2)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(cider-popup-on-error t)
 '(cider-popup-stacktraces t)
 '(cider-repl-history-file "~/.emacs.d/nrepl-history.log")
 '(cider-show-error-buffer t t)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(ecb-options-version "2.40")
 '(european-calendar-style t)
 '(fill-column 120)
 '(ggtags-global-abbreviate-filename nil)
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(idle-highlight-idle-time 0.1)
 '(inferior-js-program-command "/usr/local/bin/phantomjs")
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-screen t)
 '(jedi:install-imenu nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(large-file-warning-threshold nil)
 '(mac-font-panel-mode nil)
 '(magit-diff-refine-hunk (quote all))
 '(magit-use-overlays t)
 '(mark-diary-entries-in-calendar t)
 '(mouse-drag-copy-region t)
 '(mouse-wheel-mode t nil (mwheel))
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote super))
 '(ns-right-alternate-modifier (quote meta))
 '(ns-right-command-modifier (quote left))
 '(number-of-diary-entries 3)
 '(package-selected-packages
   (quote
    (sesman clj-refactor calfw-ical docker-tramp dockerfile-mode ess dash-at-point graphviz-dot-mode groovy-mode which-key terraform-mode yasnippet wgrep starter-kit spinner smex scala-mode sbt-mode s queue python-environment popwin popup pkg-info peg paredit nose multiple-cursors magit-popup json-snatcher json-reformat js2-mode jedi-core jedi ido-ubiquitous ido-completing-read+ idle-highlight-mode hydra helm-core helm git-gutter fringe-helper flymake-easy flx find-file-in-project es-windows es-lib epl epc elisp-slime-nav edn direx deferred ctable concurrent company color-theme auto-complete yaml-mode writegood-mode wgrep-ag web-beautify typed-clojure-mode starter-kit-lisp starter-kit-eshell starter-kit-bindings sr-speedbar smartparens slamhound request rainbow-delimiters project-explorer php-mode occur-context-resize nose-mode nlinum nginx-mode newlisp-mode mo-git-blame midje-mode markdown-mode magit-find-file lua-mode levenshtein less-css-mode latest-clojure-libraries jump-char jsx-mode json-mode js3-mode js2-refactor js2-closure js-comint jedi-direx javap-mode isearch+ iedit icicles hy-mode highlight-symbol highlight-parentheses highlight helm-cmd-t guile-scheme gtags gitconfig git-gutter-fringe ggtags free-keys flymake-json flymake-jshint flx-ido find-file-in-repository expand-region exec-path-from-shell eval-sexp-fu etags-table etags-select epoch-view ensime ecb cycbuf command-t color-theme-solarized color-theme-github clojurescript-mode clojure-mode-extra-font-locking clojure-cheatsheet cljdoc cedit buffer-move anyins ace-jump-mode ac-ispell)))
 '(python-shell-interpreter "python")
 '(safe-local-variable-values
   (quote
    ((cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend")
     (cider-cljs-lein-repl . "(do (dev) (go) (cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(scroll-bar-mode (quote right))
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(tab-width 4)
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

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun delete-whole-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))
(setq kill-whole-line t)
;; Replace forward-delete-char with kill-whole-line
(global-set-key (kbd "C-d") 'delete-whole-line)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(add-hook 'c-mode-hook 'imenu-add-menubar-index)
(add-hook 'c++-mode-hook 'imenu-add-menubar-index)

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

;; to setup tabs, from: http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
(setq c-basic-indent 2)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "/Users/kimmoko/.cabal/share/x86_64-osx-ghc-7.8.3/ghc-mod-5.1.1.0")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(defun clojure-config ()
  "Clojure configuration"
  (require 'clojure-mode)
  ;(require 'monroe)
  ;(add-hook 'clojure-mode-hook 'clojure-enable-monroe)
  (setq cider-font-lock-dynamically '(macro core function var))
  (add-hook 'clojure-mode-hook (lambda ()
                                 (yas-minor-mode 1)))
  (add-hook 'clojure-mode-hook 'linum-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'highlight-parentheses-mode)
  (add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'subword-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  ;(add-hook 'cider-mode-hook 'cider-profile-mode)
  ;(add-hook 'cider-repl-mode-hook 'cider-profile-mode)
  (add-to-list 'auto-mode-alist '("\.cljc$" . clojure-mode))

  (add-hook 'shell-mode (lambda () (setq show-trailing-whitespace nil)))
  (add-hook 'inferior-python-mode (lambda () (setq show-trailing-whitespace nil)))
  (setq nrepl-buffer-name-show-port t)
  (setq cider-prompt-save-file-on-load nil)
  (setq cider-show-error-buffer 'except-in-repl)
  (setq cider-auto-select-error-buffer nil)
  (setq cider-prompt-for-symbol nil)
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  (eval-after-load 'cider
    '(let ((reloaded-reset (lambda ()
                            (interactive)
                            (save-some-buffers)
                            (with-current-buffer (cider-current-repl-buffer)
                              (cider-interactive-eval
                               "(reloaded.repl/reset)")))))
      (define-key cider-mode-map (kbd "C-'") reloaded-reset)
      (define-key clojure-mode-map (kbd "C-'") reloaded-reset)))
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
    ;; core.match
    (match 'defun)
    (with-additional-middleware 'defun)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "JAVA_HOME"))
(when window-system
  (load-theme 'deeper-blue t))
(setq ring-bell-function #'ignore)

(require 'highlight-symbol)
;;(global-unset-key [(kbd "kp-home")])

;(global-set-key [end] (quote highlight-symbol-next))
(global-set-key [end] 'highlight-symbol-next)
(global-set-key [home] 'highlight-symbol-prev)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'newlisp-mode-hook 'paredit-mode)
(add-hook 'comint-mode-hook (lambda ()
                              (when (equal (buffer-name) "*newlisp*")
                                (paredit-mode 1))))
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'c++-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'js-mode-hook 'linum-mode)
(add-hook 'js2-mode-hook 'linum-mode)
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-mode)
(require 'flymake-json)
(add-hook 'json-mode 'flymake-json-load)
(require 'iedit)
(require 'auto-complete-config)
(ac-config-default)
(global-set-key (kbd "C-x f") 'find-file-in-repository)
(global-set-key (kbd "M-z") 'er/expand-region)
(delete-selection-mode 1)
(global-set-key (kbd "<f5>") 'ag-project)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)
(menu-bar-mode 1)
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)
(setq mouse-wheel-progressive-speed nil)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Windmove, chage bindings
(dolist (key '("S-<up>" "S-<down>" "S-<left>" "S-<right>"))
  (global-unset-key (kbd key)))
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<up>") 'windmove-up)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
(add-hook 'js2-mode 'linum-mode)
(require 'rainbow-delimiters)
(clojure-config)
(require 'smartparens-config)
(add-hook 'c++-mode-hook (lambda () (smartparens-mode 1)))
(add-hook 'c-mode-hook (lambda () (smartparens-mode 1)))
(require 'git-gutter-fringe)
(require 'project-explorer)
(autoload 'newlisp-mode "newlisp-mode" "Major mode for newLISP files." t)
(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))
(add-to-list 'interpreter-mode-alist '("newlisp" . newlisp-mode))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(require 'highlight-parentheses)

(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-local-dictionary-alist '(("finnish"
                                       "[%.0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[^.%0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[':]"
                                       nil
                                       ("--dict-dir" "/Library/Application Support/cocoAspell/aspell6-fi-0.7-0" "-d" "finnish" )
                                       nil
                                       utf-8)
                                      ("english"
                                       "[A-Za-z]"
                                       "[^A-Za-z]"
                                       "[']"
                                       nil
                                       ("--dict-dir" "/Library/Application Support/cocoAspell/aspell6-en-7.1-0" "-d" "english" )
                                       nil
                                       utf-8)))

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode t)
(put 'narrow-to-region 'disabled nil)
(server-mode 1)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl" 'js-load-file-and-go)))

(setq magit-last-seen-setup-instructions "1.4.0")

(electric-indent-mode +1)

;(global-set-key (kbd "RET") 'newline-and-indent)

(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)
