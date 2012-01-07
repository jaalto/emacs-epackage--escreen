;; Prevent loading this file. Study the examples.
(error "escreen-epkg-examples.el is not a configuration file.")

;; In some keyboards the default key C-\ is not easily accessible,
;; In QWERTY keyboard, M-z is easily accessible,
;;
;; Prefix key Commands:
;; c)reate
;; g)oto
;; k)ill
;; 0..9) select screen
;; ?)help
;; n)ext screen
;; p)rev screen
;; C-b) menu

(setq escreen-prefix-char "\M-z")
(require escreen-epkg-xactivate)   ; Setup to activate escreen on keypress

;; End of file
