;;; packages.el --- custodia-evil-line-numbers layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <jani@destiny>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `custodia-evil-line-numbers-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `custodia-evil-line-numbers/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `custodia-evil-line-numbers/pre-init-PACKAGE' and/or
;;   `custodia-evil-line-numbers/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst custodia-evil-line-numbers-packages
  '()
  "The list of Lisp packages required by the custodia-evil-line-numbers layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

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


;;; packages.el ends here
