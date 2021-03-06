;;; packages.el --- howm layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Kota Kobayashi <kkobayas@Kota-no-MBP>
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
;; added to `howm-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `howm/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `howm/pre-init-PACKAGE' and/or
;;   `howm/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst howm-packages
  '(howm
    )
  "The list of Lisp packages required by the howm layer.

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

(defun howm/init-howm ()
  (use-package howm
    :config
    (setq howm-menu-lang 'ja)
    (setq howm-menu-recent-num 7)
    (setq howm-directory "~/dropbox/howm/")
    (setq howm-keyword-file "~/dropbox/howm/.howm-keys")
    (setq howm-file-name-format "%Y/%m/%Y-%m-%d_%H%M%S.org")
    (setq howm-keyword-case-fold-search t)
    (setq howm-view-split-horizontally t)
    (setq howm-view-use-grep t)
    ;; grep setting
    (setq howm-view-grep-command "rg")
    (setq howm-view-grep-option "-nH --no-heading --color never")
    (setq howm-view-grep-extended-option nil)
    (setq howm-view-grep-fixed-option "-F")
    (setq howm-view-grep-expr-option nil)
    (setq howm-view-grep-file-stdin-option nil)
    ;; migemo
    (setq howm-migemo-client '((type . cmigemo) (command . "cmigemo")))
    (cond ((equal system-type 'darwin)
           (setq howm-migemo-client-option '("-q" "-d" "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")))
          ((equal system-type 'gnu/linux)
           (setq howm-migemo-client-option '("-q" "-d" "/usr/share/cmigemo/utf-8/migemo-dict"))))
    ;; keymap
    (spacemacs/declare-prefix "," "howm")
    (spacemacs/set-leader-keys ",," 'howm-menu)
    (spacemacs/set-leader-keys ",." 'howm-find-today)
    (spacemacs/set-leader-keys ",:" 'howm-find-yesterday)
    (spacemacs/set-leader-keys ",a" 'howm-list-all)
    (spacemacs/set-leader-keys ",c" 'howm-create)
    (spacemacs/set-leader-keys ",d" 'howm-insert-date)
    (spacemacs/set-leader-keys ",e" 'howm-remember)
    (spacemacs/set-leader-keys ",i" 'howm-insert-keyword)
    (spacemacs/set-leader-keys ",m" 'howm-list-migemo)
    (spacemacs/set-leader-keys ",o" 'howm-occur)
    (spacemacs/set-leader-keys ",T" 'howm-insert-dtime)
    ))

;;; packages.el ends here
