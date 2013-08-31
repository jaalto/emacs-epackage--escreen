;; Description:
;; Arrgange autoloading package. Pressing prefix key causes
;; loading the package and setting up empty 0-9 screens.

(defvar escreen-prefix-char (kbd "\C-\\")) ;; The default

(eval-when-compile
  (defvar escreen-map))

(autoload 'escreen-map				"escreen" "" 'keymap)
(autoload 'escreen-menu-mode                    "escreen" "" t)
(autoload 'escreen-create-screen                "escreen" "" t)
(autoload 'escreen-kill-screen                  "escreen" "" t)
(autoload 'escreen-goto-screen                  "escreen" "" t)
(autoload 'escreen-goto-last-screen             "escreen" "" t)
(autoload 'escreen-goto-prev-screen             "escreen" "" t)
(autoload 'escreen-goto-next-screen             "escreen" "" t)
(autoload 'escreen-help                         "escreen" "" t)
(autoload 'escreen-install                      "escreen" "" t)
(autoload 'escreen-get-current-screen-number    "escreen")
(autoload 'escreen-get-active-screen-numbers    "escreen")
(autoload 'escreen-first-unused-screen-number   "escreen")
(autoload 'escreen-goto-screen-1                "escreen")

(defun escreen-epackage-activate-preset ()
  "Preload screens 0..9."
  (interactive)
  (let (nbr)
    (when (setq nbr (escreen-first-unused-screen-number))
      (while (< nbr 10)
	(escreen-create-screen)
	(setq nbr (1+ nbr)))
      (escreen-goto-screen-1))))

(defun escreen-epackage-activate-init ()
  "Initialize escreen."
  (when escreen-map
    (escreen-install)
    (escreen-epackage-activate-preset)))

(defun escreen-epackage-activate-setup ()
  "Escreen setup"
  (interactive)
  (when (and (not (featurep 'escreen))
	     (load "escreen" 'noerr))
    (escreen-epackage-activate-init)))

;; If escreen is not yet active
(unless (eq (lookup-key global-map escreen-prefix-char)
	    'escreen-prefix)
  (global-set-key escreen-prefix-char 'escreen-epackage-activate-setup))

(provide 'escreen-xactivate)
