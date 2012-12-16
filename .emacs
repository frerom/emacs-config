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

;;;;;;;;;; Package ;;;;;;;;;;
(require 'package)

(setq packages
  '(clojure-mode
   paredit))

(add-to-list 'package-archives
	     '("marmalde" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(loop for p in packages do 
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'clojure-mode-hook 'paredit-mode)
