;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Luqmanul Hakim"
      user-mail-address "saya567.mn@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 15)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 26))
      ;;doom-variable-pitch-font (font-spec :family "Overpass" :size 24)
      ;;doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Syntax highlight code blocks
(setq org-src-fontify-natively t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set evil escape to kj like in my vim config
(setq-default evil-escape-key-sequence "kj")

;; clangd lsp settings
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))

;; Set project path for projectile
(setq projectile-project-search-path '("~/projects/"))

;; Centaur Tabs settings
(after! centaur-tabs (centaur-tabs-group-by-projectile-project))

;; Org Roam variables
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))

;; Deft notes Directory
(setq deft-directory "~/org/roam")

;; Fringe size
(fringe-mode 8)

;; Import environment from keychain
(keychain-refresh-environment)

;; Allow management of yadm from magit
(add-to-list 'tramp-methods
 '("yadm"
   (tramp-login-program "yadm")
   (tramp-login-args (("enter")))
   (tramp-login-env (("SHELL") ("/bin/sh")))
   (tramp-remote-shell "/bin/sh")
   (tramp-remote-shell-args ("-c"))))

(defun ea-popup-handler (app-name window-title x y w h)
  ;; other stuff here
  (when (gui-get-selection 'PRIMARY) (insert (gui-get-selection 'PRIMARY)))
  (set-transient-map (let ((keymap (make-sparse-keymap)))
                          (define-key keymap (kbd "DEL")   (lambda! (delete-region (point-min) (point-max))))
                          (define-key keymap (kbd "C-SPC") (lambda! (delete-region (point-min) (point-max))))
                          keymap)))
