;;; doom-pripyat-theme.el --- Pripyat -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

(def-doom-theme doom-pripyat
  "Pripyat: Warm paper light theme + Everforest greens + no syntax highlighting + golden cursor."

  ;; Warm, desaturated light palette
  ((bg         '("#f4f1e6" nil nil))   ; warm paper
   (bg-alt     '("#ede8da" nil nil))
   (base0      '("#ffffff" "white" "white"))
   (base1      '("#ede8da" "#f0f0f0" "brightwhite"))
   (base2      '("#e2dccb" "#e0e0e0" "brightwhite"))
   (base3      '("#d6d0bf" "#d0d0d0" "brightwhite"))
   (base4      '("#b8b2a1" "#b0b0b0" "brightwhite"))
   (base5      '("#9d9787" "#909090" "brightwhite"))
   (base6      '("#6e6a5e" "#707070" "brightblack"))
   (base7      '("#4f4c43" "#505050" "brightblack"))
   (base8      '("#2f2c25" "#303030" "black"))

   ;; Text slightly muted, not harsh black
   (fg         '("#3c3a33" "#303030" "black"))
   (fg-alt     '("#6e6a5e" "#707070" "brightblack"))

   ;; Everforest greens (UI/meta only)
   (green-1    '("#6f8f5f" "#6f8f5f" "green"))
   (green-2    '("#5f7f4f" "#5f7f4f" "green"))
   (green-3    '("#8f9f7f" "#8f9f7f" "green"))

   ;; Subtle earth accent
   (earth      '("#a68b5b" "#a68b5b" "yellow"))

   ;; No semantic coloring
   (grey       base6)
   (red        fg)
   (orange     fg)
   (green      fg)
   (teal       fg)
   (yellow     fg)
   (blue       fg)
   (dark-blue  fg)
   (magenta    fg)
   (violet     fg)
   (cyan       fg)
   (dark-cyan  fg)

   ;; UI mappings
   (highlight      base2)
   (vertical-bar   base3)
   (selection      base3)
   (builtin        fg)
   (comments       fg)
   (doc-comments   fg)
   (constants      fg)
   (functions      fg)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           fg)
   (strings        fg)
   (variables      fg)
   (numbers        fg)
   (region         selection)

   (error          fg)
   (warning        fg)
   (success        fg)
   (vc-modified    fg)
   (vc-added       fg)
   (vc-deleted     fg)

   (modeline-fg              fg)
   (modeline-fg-alt          fg-alt)
   (modeline-bg              base1)
   (modeline-bg-inactive     bg-alt)
   (modeline-fg-inactive     base5))

  ;;;; Face overrides
  ((default :background bg :foreground fg)

   ;; HARD RULE: NO SYNTAX HIGHLIGHTING
   (font-lock-builtin-face :foreground fg :weight 'normal)
   (font-lock-comment-face :foreground fg :weight 'normal :slant 'normal)
   (font-lock-comment-delimiter-face :foreground fg :weight 'normal)
   (font-lock-doc-face :foreground fg :weight 'normal)
   (font-lock-constant-face :foreground fg :weight 'normal)
   (font-lock-function-name-face :foreground fg :weight 'normal)
   (font-lock-keyword-face :foreground fg :weight 'normal)
   (font-lock-string-face :foreground fg :weight 'normal)
   (font-lock-type-face :foreground fg :weight 'normal)
   (font-lock-variable-name-face :foreground fg :weight 'normal)
   (font-lock-warning-face :foreground fg :weight 'normal)
   (font-lock-number-face :foreground fg :weight 'normal)
   (font-lock-preprocessor-face :foreground fg :weight 'normal)

   ;; Permanent golden cursor
   (cursor :background "#ffdd33" :foreground "#000000")

   ;; Subtle focus
   (hl-line :background base1)
   (region :background base3)
   (highlight :background base2)

   ;; Line numbers
   (line-number :foreground base5 :background bg)
   (line-number-current-line :foreground fg :background bg-alt :weight 'normal)

   ;; Borders/fringe
   (vertical-border :foreground base2)
   (fringe :background bg :foreground base5)
   (shadow :foreground fg-alt)

   ;; Minibuffer prompt in forest green
   (minibuffer-prompt :foreground green-2 :weight 'normal)

   ;; Mode line with green accent
   (mode-line :background base1 :foreground fg :box `(:line-width 1 :color ,base2))
   (mode-line-inactive :background bg-alt :foreground base6 :box `(:line-width 1 :color ,base2))
   (doom-modeline-bar :background green-2)

   ;; Subtle accents
   (doom-modeline-project-dir :foreground green-1 :weight 'normal)
   (doom-modeline-buffer-modified :foreground earth :weight 'normal)

   ;; Links in green (no blue)
   (link :foreground green-1 :underline t :weight 'normal)
   (link-visited :foreground green-3 :underline t :weight 'normal)

   ;; Search
   (isearch :background base3 :foreground fg :weight 'normal)
   (lazy-highlight :background base2 :foreground fg :weight 'normal)

   ;; Org + Markdown minimal
   (org-meta-line :foreground green-3)
   (org-link :foreground green-1 :underline t)
   (markdown-link-face :foreground green-1 :underline t)
   (markdown-url-face :foreground green-1 :underline t)

   ;; Diagnostics subtle
   (success :foreground green-1)
   (warning :foreground earth)
   (error   :foreground "#c97f6f")))

(provide-theme 'doom-pripyat)
;;; doom-pripyat-theme.el ends here
