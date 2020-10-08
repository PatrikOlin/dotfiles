;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Load personal modules

(load! "+javascript")
;; (load! "+zetteldeft")

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Patrik Olin"
      user-mail-address "enmejl@gmail.com")

;; Set indentation
;; (setq-default tab-width 2
;;               tab-width 2
;;               javascript-2-level 1
;;               web-mode-markup-2-offset 1
;;               web-mode-css-2-offset 1
;;               web-mode-code-2-offset 1
;;               css-2-offset 1)

(setq auth-source-debug t)
(setq auth-sources '("~/.authinfo"))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "Hack" :size 16)
      doom-variable-pitch-font (font-spec :family "Hack"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents/org")
(require 'org)
(setq org-log-done t)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                         :tag "bo")))
  :config
  (org-super-agenda-mode))


;; Company autocomlpete
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;;Go-lsp-fix
(setq lsp-gopls-codelens nil)
;; Mac-horeri
;; (setq mac-option-modifier nil
;;       mac-command-modifier 'meta
;;       select-enable-clipboard t)

;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

;; org-jirA
  (setq jiralib-url "https://blinfo.atlassian.net")
(setq request-log-level 'debug)
(setq request-message-level 'debug)

;; zetteldeft & deft

;; (use-package! deft
;;   :ensure t
;;   :custom
;;     (deft-extensions '("org" "md" "txt"))
;;     (deft-directory "~/notes")
;;     (deft-use-filename-as-title t)
;; )

;; (use-package! deft
;;   :ensure t
;;   :after deft
;;   :config (zetteldeft-set-classic-keybindings)

;; (defcustom zetteldeft-link-indicator "$"
;;   "String to indicate zetteldeft links.
;; String prepended to IDs to easily identify them as links to zetteldeft notes.
;; This variable should be a string containing only one character."
;;   :type 'string
;;   :group 'zetteldeft
;;   :set 'zetteldeft--id-font-lock-setup)
;; )

;; Add both changes in ediff
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)


;; keybindings
(map! :leader
      (:prefix "j"
        :nv "j" #'evil-jump-backward
        :nv "b" #'evil-jump-backward
        :nv "f" #'evil-jump-forward
        :nv "l" #'+ivy/jump-list
       )
      (:prefix "t"
        :nv "f" #'tide-fix
        :nv "r" #'tide-references
        :nv "R" #'tide-refactor
        :nv "d" #'tide-jump-to-definition
        :nv "b" #'tide-jump-back
        :nv "e" #'tide-goto-error)
      (:prefix "ö"
        :nv "f w" #'deadgrep
        :nv "f f" #'counsel-fzf
        :nv "r p" #'point-to-register
        :nv "j p" #'jump-to-register
        :nv "t" #'projectile-run-vterm)
      (:prefix "a"
        :nv "f" #'avy-goto-char-2
        :nv "m r" #'avy-move-region
        :nv "c r" #'avy-copy-region
        :nv "k r" #'avy-kill-region
        :nv "m l" #'avy-move-line
        :nv "c l" #'avy-copy-line
        :nv "k l" #'avy-kill-whole-line)
      (:prefix "m"
        :nv "a" #'evil-multiedit-match-all
        :nv "i" #'evil-multiedit-insert-state)
      (:prefix "v"
        :nv "f" #'vimish-fold-toggle
        :nv "c f" #'vimish-fold-avy
        :nv "n f" #'vimish-fold-next-fold
        :nv "t a" #'vimish-fold-toggle-all
        :nv "u a" #'vimish-fold-unfold-all
        :nv "r a" #'vimish-fold-refold-all)
      (:prefix "f"
        :n "o o" #'nil
        :n "o c" #'nil)
      )

;; remap whatever f was to avy
(map! :nv "f" #'nil)
(map! :nv "f" #'avy-goto-char-2)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'before-save-hook 'prettier-js-mode)

(eval-after-load
  'typescript-mode
  '(add-hook 'typescript-mode-hook #'add-node-modules-path))

(use-package wakatime-mode
  :init
  (add-hook 'prog-mode-hook 'wakatime-mode)
  :config (global-wakatime-mode))

(custom-set-variables '(wakatime-api-key "954b96a3-3364-4821-bca2-eccfe5d1fa27"))

;; (use-package evil-commentary
  ;; :init
  ;; (evil-commentary-mode))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
