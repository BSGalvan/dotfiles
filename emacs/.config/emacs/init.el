;; Turn on some much needed UI/UX elements
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(hl-line-mode 1)
(blink-cursor-mode 1)
(column-number-mode t)
(fringe-mode 10)

;; Turn off some unneeded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq inhibit-startup-message t  ; Don't display splash screen
      visible-bell t)            ; Flash screen for attention

;; Use M-x recentf-open-files to see recently opened files
(recentf-mode 1)

;; Remember minibuffer prompt inputs
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Move customization variables to separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Customize font settings
(set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 140)
(set-face-attribute 'fixed-pitch nil :family "FiraCode Nerd Font Mono" :height 120)

;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Auto-refresh buffers when they change on disk
(global-auto-revert-mode 1)

;; Auto-refresh non-file buffers (such as Dired)
(setq global-auto-revert-non-file-buffers t)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


(require 'use-package)
(setq use-package-always-ensure t)

;; ivy goes well with counsel and swiper
(use-package swiper
  :diminish)

;; Set up some extra keybinds so that counsel works together with ivy-rich
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

;; Spruce up the modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Add in doom-themes because why not
(use-package doom-themes
  :custom (doom-themes-visual-bell-config)
  :init (load-theme 'doom-vibrant t))

;; Icons everywhere!
(use-package all-the-icons
  :if (display-graphic-p))

;; Rainbow parenthesis
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Helpful key completions
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Helpful descriptions of functions and variables
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))


(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

;; Saner way to setup global and mode-specific keybindings
(use-package general
  :config
  (general-create-definer bsg/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (bsg/leader-keys
    "tt" '(counsel-load-theme :which-key "choose theme")))

;; "Here's a little lesson in trickery..."

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
 
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  ;; Set starting modes for some buffers
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(bsg/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))
