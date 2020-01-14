;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Load personal modules

(load! "+javascript")

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
(setq doom-theme 'doom-gruvbox)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

(def-package! org-super-agenda
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

;; Mac-horeri
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      select-enable-clipboard t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; org-jirA
  (setq jiralib-url "https://blinfo.atlassian.net")
(setq request-log-level 'debug)
(setq request-message-level 'debug)

;; emmet bindings
(map! :leader
      "m e l" 'emmet-expand-line)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)


(use-package wakatime-mode
  :init
  (add-hook 'prog-mode-hook 'wakatime-mode)
  :config (global-wakatime-mode))

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
