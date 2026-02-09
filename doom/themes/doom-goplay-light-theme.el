;;; doom-goplay-light-theme.el --- Go Playground Light -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'doom-themes)

(def-doom-theme doom-goplay-light
  "Go Playground light theme (no syntax highlighting)"

  ;; name        default     256       16
  ((bg         '("#ffffff"   nil       nil))
   (bg-alt     '("#f7f7f7"   nil       nil))
   (base0      '("#ffffff"   "white"   "white"))
   (base1      '("#f2f2f2"   nil       nil))
   (base2      '("#eaeaea"   nil       nil))
   (base3      '("#dddddd"   nil       nil))
   (base4      '("#cccccc"   nil       nil))
   (base5      '("#b3b3b3"   nil       nil))
   (base6      '("#8a8a8a"   nil       nil))
   (base7      '("#5a5a5a"   nil       nil))
   (base8      '("#000000"   nil       nil))
   (fg         '("#000000"   nil       nil))
   (fg-alt     '("#333333"   nil       nil))

   (grey       base6)
   (red        base8)
   (orange     base8)
   (green      base8)
   (blue       base8)
   (yellow     base8)
   (violet     base8)
   (teal       base8)
   (dark-blue  base8)
   (magenta    base8)
   (cyan       base8)
   (dark-cyan  base8)

   ;; Required categories (all neutralized)
   (highlight      base2)
   (vertical-bar   base3)
   (selection      '("#cfe8ff" nil nil))
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

   ;; Modeline
   (modeline-bg base1)
   (modeline-bg-l base1)
   (modeline-bg-inactive base1)
   (modeline-bg-inactive-l base1))

  ;;;; Face overrides
  (((default &override) :background bg :foreground fg)

   ;; remove ALL syntax coloring
   (font-lock-comment-face :inherit 'default)
   (font-lock-comment-delimiter-face :inherit 'default)
   (font-lock-string-face :inherit 'default)
   (font-lock-keyword-face :inherit 'default)
   (font-lock-function-name-face :inherit 'default)
   (font-lock-variable-name-face :inherit 'default)
   (font-lock-type-face :inherit 'default)
   (font-lock-constant-face :inherit 'default)
   (font-lock-builtin-face :inherit 'default)
   (font-lock-warning-face :inherit 'default)
   (font-lock-number-face :inherit 'default)

   ;; line numbers
   (line-number :foreground base5 :background bg)
   (line-number-current-line :foreground fg :background bg)

   ;; UI polish
   (cursor :background fg)
   (region :background selection)
   (hl-line :background base1)
   (vertical-border :foreground base3)
   (mode-line :background modeline-bg :foreground fg)
   (mode-line-inactive :background modeline-bg-inactive :foreground base6)
   (minibuffer-prompt :foreground fg)
   (link :foreground fg :underline t)
   (shadow :foreground base6)))
