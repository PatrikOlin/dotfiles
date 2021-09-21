(require 'prettier-js)

;; (after! tide
;;   (setq tide-completion-detailed t
;;         tide-always-show-documentation t)
;;   )

;; (add-hook 'tide-mode-hook 'prettier-js-mode)
(eval-after-load 'typescript-mode
    '(progn
       (add-hook 'typescript-mode-hook #'add-node-modules-path)
       (add-hook 'typescript-mode-hook #'prettier-js-mode)
       (add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.jsx?\\'" . prettier-js-mode ))))
       ))
;; (add-hook 'js2-mode-hook 'prettier-js-mode)

;; (add-hook 'web-mode-hook 'prettier-js-mode)


;; dont use lsp-formatter for typescript

;; (add-hook 'typescript-mode-hook 'prettier-js-mode)

;; (setq prettier-js-args '(
;;   "--trailing-comma" "all"
;;   ;; "--semi" "all"
;;   ;; "single-quote" "true"
;;   ))
