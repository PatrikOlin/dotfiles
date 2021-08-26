;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Load personal modules

(load! "+javascript")
;;(load! "+go")
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
;;
;; Make sure to use exec-path-from-shell when run as daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

;; (setq auth-source-debug t)
(setq auth-sources '("~/.authinfo.gpg"))

;; word-wrap in all text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(global-set-key [S-dead-grave] "`")
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
(setq doom-font (font-spec :family "Input" :size 16)
      doom-variable-pitch-font (font-spec :family "Input"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.:w
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents/org")
(require 'org)
(setq org-log-done t)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'nil)

;; Company autocomlpete
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;; (use-package! tree-sitter
;;   :config
;;   (require 'tree-sitter-langs)
;;   (global-tree-sitter-mode)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;;Go-lsp-fix
(setq lsp-gopls-codelens nil)
;; Mac-horeri
;; (setq mac-option-modifier nil
;;       mac-command-modifier 'meta
;;       select-enable-clipboard t)

;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

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
(global-set-key "\C-x\C-m" 'execute-extended-command)
(map! :leader
      (:prefix "j"
       :nv "j" #'evil-jump-backward
       :nv "b" #'evil-jump-backward
       :nv "f" #'evil-jump-forward
       :nv "l" #'+ivy/jump-list
       )
      (:prefix "ö"
       :nv "f w" #'deadgrep
       :nv "f f" #'counsel-fzf
       :nv "r p" #'point-to-register
       :nv "j p" #'jump-to-register
       :nv "t" #'projectile-run-vterm
       :nv "p" #'persp-switch)
      (:prefix "k"
       :nv "l" #'avy-kill-whole-line
       :nv "r" #'avy-kill-region)
      (:prefix "y"
       :nv "l" #'avy-copy-line
       :nv "r" #'avy-copy-region)
      (:prefix "m"
       :nv "l" #'avy-move-line
       :nv "r" #'avy-move-region)
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
       :n "o c" #'nil
       :n "s" (cmd!(find-private-dir "~/scripts/"))
       :n "c" (cmd!(find-private-dir "~/.config/"))
       )
      (:prefix "l"
       :n "p b" #'lsp-ui-peek-jump-backward
       :n "p f" #'lsp-ui-peek-jump-forward
       :n "d" #'lsp-ui-doc-glance
       :n "p i" #'lsp-ui-peek-find-implementation
       :n "p r" #'lsp-ui-peek-find-references
       )
      (:prefix "w"
       :n "SPC" #'winsize-incremental-resize)
      )


;; remap whatever f was to avy
(map! :nv "f" #'nil)
(map! :nv "f" #'avy-goto-char-timer)

;; Run prettier in webdev modes
;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'tide-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)
;; (add-hook 'before-save-hook 'prettier-js-mode)

;; evil terminal cursor changer, change cursor shape by evil state in terminal
(unless (display-graphic-p)
        (require 'evil-terminal-cursor-changer)
        (evil-terminal-cursor-changer-activate) ; or (etcc-on)
     )

(eval-after-load
    'typescript-mode
  '(add-hook 'typescript-mode-hook #'add-node-modules-path))

(use-package wakatime-mode
  :init
  (add-hook 'prog-mode-hook 'wakatime-mode)
  :config (global-wakatime-mode))

(custom-set-variables '(wakatime-api-key "954b96a3-3364-4821-bca2-eccfe5d1fa27"))

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-root))

;; LSP configuration

;; (mapc (lambda (f) (set-face-foreground f "dim gray"))
;;    '(lsp-ui-sideline-current-symbol lsp-ui-sideline-symbol lsp-ui-sideline-symbol-info))
(setq lsp-ui-doc 'nil)
(setq lsp-ui-doc-position 'at-point
      lsp-ui-doc-max-height 800
      lsp-ui-doc-max-width 150)

;;; Angular

;;(add-to-list 'lsp-disabled-clients '(web-mode . angular-ls))

(add-hook 'neuron-mode-hook 'turn-on-auto-fill)

;; DAP configuration


;; undo-fu
(use-package evil
  :init
  (setq evil-undo-system 'undo-fu))

;;projectile
;; (use-package projectile
;;
;;   (projectile-indexing-method 'alien)
;; )

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

;; mu4e
;; (require 'mu4e)

;; (setq mu4e-maildir "~/.mail"
;; mu4e-attachment-dir "~/Downloads")

;; (setq user-mail-address "patrik@olin.work"
;; user-full-name  "Patrik Olin")

;; ;; Get mail
;; (setq mu4e-get-mail-command "mbsync protonmail"
;; mu4e-change-filenames-when-moving t   ; needed for mbsync
;; mu4e-update-interval 120)             ; update every 2 minutes

;; ;; Send mail
;; (setq message-send-mail-function 'smtpmail-send-it
;; smtpmail-auth-credentials "~/.authinfo.gpg"
;; smtpmail-smtp-server "127.0.0.1"
;; smtpmail-stream-type 'starttls
;; smtpmail-smtp-service 1025)

;; (add-to-list 'gnutls-trustfiles (expand-file-name "~/.config/protonmail/bridge/cert.pem"))

(defun find-private-dir (dir)
  "Search for a file in DIR."
  (interactive)
  (doom-project-find-file dir))


;; anki
(use-package anki-editor
  :after org
  :bind (:map org-mode-map
              ("<f12>" . anki-editor-cloze-region-auto-incr)
              ("<f11>" . anki-editor-cloze-region-dont-incr)
              ("<f10>" . anki-editor-reset-cloze-number)
              ("<f9>"  . anki-editor-push-tree))
  :hook (org-capture-after-finalize . anki-editor-reset-cloze-number) ; Reset cloze-number after each capture.
  :config
  (setq anki-editor-create-decks t ;; Allow anki-editor to create a new deck if it doesn't exist
        anki-editor-org-tags-as-anki-tags t)

  (defun anki-editor-cloze-region-auto-incr (&optional arg)
    "Cloze region without hint and increase card number."
    (interactive)
    (anki-editor-cloze-region my-anki-editor-cloze-number "")
    (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
    (forward-sexp))
  (defun anki-editor-cloze-region-dont-incr (&optional arg)
    "Cloze region without hint using the previous card number."
    (interactive)
    (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
    (forward-sexp))
  (defun anki-editor-reset-cloze-number (&optional arg)
    "Reset cloze number to ARG or 1"
    (interactive)
    (setq my-anki-editor-cloze-number (or arg 1)))
  (defun anki-editor-push-tree ()
    "Push all notes under a tree."
    (interactive)
    (anki-editor-push-notes '(4))
    (anki-editor-reset-cloze-number))
  ;; Initialize
  (anki-editor-reset-cloze-number)
  )

;; Org-capture templates
(setq org-my-anki-file "/home/olin/anki/anki.org")
(add-to-list 'org-capture-templates
             '("a" "Anki basic"
               entry
               (file+headline org-my-anki-file "Dispatch Shelf")
               "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Mega\n:END:\n** Front\n%?\n** Back\n%x\n"))
(add-to-list 'org-capture-templates
             '("A" "Anki cloze"
               entry
               (file+headline org-my-anki-file "Dispatch Shelf")
               "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: Mega\n:END:\n** Text\n%x\n** Extra\n"))

;; Allow Emacs to access content from clipboard.
(setq select-enable-clipboard t
      select-enable-primary t)

(defun make-orgcapture-frame ()
    "Create a new frame and run org-capture."
    (interactive)
    (make-frame '((name . "org-capture") (window-system . x)))
    (select-frame-by-name "org-capture")
    (counsel-org-capture)
    (delete-other-windows)
    )

;; Elixir LSP
  (use-package lsp-mode
    :commands lsp
    :ensure t
    :diminish lsp-mode
    :hook
    (elixir-mode . lsp)
    :init
    (add-to-list 'exec-path "~/elixir-ls/release"))
