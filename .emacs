(require 'cl)

;;;;;;;;;; Dired ;;;;;;;;;;
(setq wdired-allow-to-change-permissions t)
(setq dired-recursive-deletes t)

;;;;;;;;;; Auto update buffer on file modification ;;;;;;;;;;
(global-auto-revert-mode t)

;;;;;;;;;; Line numbers ;;;;;;;;;;
(global-linum-mode 1)

;;;;;;;;;; Ido ;;;;;;;;;;
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;;;;;;;;;; Startup ;;;;;;;;;;
(setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)

;;;;;;;;;; Paths ;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d")

;;;;;;;;;; Packages ;;;;;;;;;;
(require 'package)

(setq packages
  '(clojure-mode
    paredit
    markdown-mode))

(add-to-list 'package-archives
	     '("marmalde" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(loop for p in packages do 
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(eval-after-load 'paredit
  '(progn
    (define-key paredit-mode-map (kbd "M-[ 5 d") 'paredit-forward-barf-sexp)
    (define-key paredit-mode-map (kbd "M-[ 5 C") 'paredit-forward-slurp-sexp)
    (define-key paredit-mode-map (kbd "ESC <right>") 'paredit-backward-barf-sexp)
    (define-key paredit-mode-map (kbd "ESC <left>") 'paredit-backward-slurp-sexp)))

;;;;;;;;;; Menu bar ;;;;;;;;;;
(menu-bar-mode -1)

;;;;;;;;;; Setting up the windows ;;;;;;;;;;

(split-window-right)
(other-window 1)
(split-window-below)
(shell)

(other-window -1)
