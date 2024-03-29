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
  (setenv "SHELL" "/usr/bin/zsh")
  (exec-path-from-shell-initialize))

;; (setq auth-source-debug t)
(setq auth-sources '("~/.authinfo.gpg"))


;; set projectile project search path
(setq projectile-project-search-path '("~/code"))

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
(setq doom-font (font-spec :family "InputMono" :size 16)
      doom-variable-pitch-font (font-spec :family "InputMono"))

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
(setq display-line-numbers-type "relative")

;; Company autocomlpete
(setq company-idle-delay 0.5
      company-minimum-prefix-length 3)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;;Go-lsp-fix
(setq lsp-gopls-codelens nil)

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
       :nv "p" #'persp-switch
       :nv "s" #'sort-fields)
      (:prefix "k"
       :nv "l" #'avy-kill-whole-line
       :nv "r" #'avy-kill-region)
      (:prefix "y"
       :nv "l" #'avy-copy-line
       :nv "r" #'avy-copy-region)
      (:prefix "m"
       :nv "l" #'avy-move-line
       :nv "r" #'avy-move-region
       :nv "a" #'evil-multiedit-match-all
       :nv "i" #'evil-multiedit-insert-state
       :nv "j" #'evil-multiedit-match-symbol-and-next
       :nv "k" #'evil-multiedit-match-symbol-and-prev)
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

;; (use-package wakatime-mode
;;   :init
;;   (add-hook 'prog-mode-hook 'wakatime-mode)
;;   :config (global-wakatime-mode))
;;
(use-package wakatime-mode
  :ensure t)

(custom-set-variables '(wakatime-api-key "954b96a3-3364-4821-bca2-eccfe5d1fa27"))
;; (custom-set-variables '(wakatime-api-key "a3e06ed3-8aa8-4df2-b2e2-0abe5701f75f"))
;; (custom-set-variables '(wakatime-api-key "9f64d522-58cf-495a-b4b7-756316f2aba0"))
;; (custom-set-variables '(wakatime-api-key "ae957cd4-a68f-4070-b472-530345ae6c77"))
(custom-set-variables '(wakatime-cli-path "/home/olin/.wakatime/wakatime-cli-linux-amd64"))


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
(setq lsp-clients-angular-language-server-command
  '("node"
    "/home/olin/.nvm/versions/node/v15.8.0/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/home/olin/.nvm/versions/node/v15.8.0/lib/node_modules"
    "--tsProbeLocations"
    "/home/olin/.nvm/versions/node/v15.8.0/lib/node_modules"
    "--stdio"))

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

(after! smartparens
  (defun zz/goto-match-paren (arg)
    "Go to the matching paren/bracket, otherwise (or if ARG is not
    nil) insert %.  vi style of % jumping to matching brace."
    (interactive "p")
    (if (not (memq last-command '(set-mark
                                  cua-set-mark
                                  zz/goto-match-paren
                                  down-list
                                  up-list
                                  end-of-defun
                                  beginning-of-defun
                                  backward-sexp
                                  forward-sexp
                                  backward-up-list
                                  forward-paragraph
                                  backward-paragraph
                                  end-of-buffer
                                  beginning-of-buffer
                                  backward-word
                                  forward-word
                                  mwheel-scroll
                                  backward-word
                                  forward-word
                                  mouse-start-secondary
                                  mouse-yank-secondary
                                  mouse-secondary-save-then-kill
                                  move-end-of-line
                                  move-beginning-of-line
                                  backward-char
                                  forward-char
                                  scroll-up
                                  scroll-down
                                  scroll-left
                                  scroll-right
                                  mouse-set-point
                                  next-buffer
                                  previous-buffer
                                  previous-line
                                  next-line
                                  back-to-indentation
                                  doom/backward-to-bol-or-indent
                                  doom/forward-to-last-non-comment-or-eol
                                  )))
        (self-insert-command (or arg 1))
      (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
            ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
            (t (self-insert-command (or arg 1))))))
  (map! "%" 'zz/goto-match-paren))

;; Vertico configuration
(setq vertico-sort-function 'vertico-sort-history-alpha)

;;; sxhkd-mode
(define-generic-mode sxhkd-mode
  '(?#)
  '("alt" "Escape" "super" "bspc" "ctrl" "space" "shift") nil
  '("sxhkdrc") nil
  "Simple mode for sxhkdrc files.")

;;; helper function to activate prettier-js only in web-mode if the file is js or jsx
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))


;;; function to clear console.logs in current buffer
(defun annihilate-console-logs ()
       (interactive)
       (save-excursion
        (goto-char (point-min))
        (while (re-search-forward "console.log(.+);*")
               (replace-match "" nil nil))
       ))

(global-wakatime-mode)
