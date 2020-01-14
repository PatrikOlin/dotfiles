(require 'prettier-js)

(after! tide
  (setq tide-completion-detailed t
        tide-always-show-documentation t)
  )

(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--semi" "all"
  "single-quote" "true"
  ))
