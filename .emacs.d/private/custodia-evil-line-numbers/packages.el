(defconst custodia-evil-line-numbers-packages
  '()
  "")

(add-hook 'prog-mode-hook 'linum-mode)
;;(setq linum-format "%4d \u2502")
(setq linum-relative-current-symbol "")

(defun enable-relative-linenum ()
  (if (linum-relative-mode)
    ()
    (linum-relative-toggle)
  )
)

(defun disable-relative-linenum ()
  (if (linum-relative-mode)
    (linum-relative-toggle)
    ()
  )
)

(with-eval-after-load 'linum
  (enable-relative-linenum))

(add-hook 'evil-insert-state-exit-hook 'enable-relative-linenum)
(add-hook 'evil-insert-state-entry-hook 'disable-relative-linenum)

