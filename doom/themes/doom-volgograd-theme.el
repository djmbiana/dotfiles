;;; doom-volgograd-theme.el --- Volgograd -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

(def-doom-theme doom-volgograd
  "Volgograd: Gruber-dark darkness + Everforest greens + no syntax highlighting + golden cursor."

  ;; Core palette (dark, gruber-leaning) + everforest accents
  ((bg         '("#181a1b" nil nil))
   (bg-alt     '("#1f2326" nil nil))
   (base0      '("#141617" "black" "black"))
   (base1      '("#1f2326" "#1e1e1e" "brightblack"))
   (base2      '("#2a2f33" "#2e2e2e" "brightblack"))
   (base3      '("#343a40" "#3a3a3a" "brightblack"))
   (base4      '("#4a5158" "#4e4e4e" "brightblack"))
   (base5      '("#6b737c" "#585858" "brightblack"))
   (base6      '("#a5adb6" "#6c6c6c" "brightblack"))
   (base7      '("#cfd6dd" "#979797" "brightblack"))
   (base8      '("#e6edf3" "#dfdfdf" "white"))

   (fg         '("#cfd6dd" "#dfdfdf" "white"))
   (fg-alt     '("#a5adb6" "#dfdfdf" "white"))

   ;; Everforest-ish greens (UI/meta only)
   (green-1    '("#a7c080" "#a7c080" "green")) ; soft green
   (green-2    '("#8faa6a" "#8faa6a" "green")) ; moss
   (green-3    '("#7f9f7f" "#7f9f7f" "green")) ; muted green-gray

   ;; Warm earth tone (only for "modified"/warning emphasis)
   (earth      '("#d3b58d" "#d3b58d" "yellow"))

   ;; Semantic colors: keep monochrome for code semantics
   (grey       base6)
   (red        fg)
   (orange     fg)
   (green      fg)
   (teal       fg)
   (yellow     fg)
   (blue       fg)     ; remove blue vibe entirely
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

   ;; === HARD RULE: NO SYNTAX HIGHLIGHTING ===
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
   (font-lock-regexp-grouping-backslash :foreground fg :weight 'normal)
   (font-lock-regexp-grouping-construct :foreground fg :weight 'normal)

   ;; Cursor (PERMANENT in theme): golden
   (cursor :background "#ffdd33" :foreground "#000000")

   ;; Focus/selection: quiet, dark, high focus
   (hl-line :background base1)
   (region :background base3)
   (highlight :background base2)

   ;; Line numbers: subdued
   (line-number :foreground base5 :background bg)
   (line-number-current-line :foreground fg :background bg-alt :weight 'normal)

   ;; Borders/fringe: low-noise
   (vertical-border :foreground base2)
   (fringe :background bg :foreground base5)
   (shadow :foreground fg)

   ;; Minibuffer prompt: moss green
   (minibuffer-prompt :foreground green-2 :weight 'normal)

   ;; Mode line: dark slab + green bar
   (mode-line :background base1 :foreground fg :box `(:line-width 1 :color ,base2))
   (mode-line-inactive :background bg-alt :foreground base6 :box `(:line-width 1 :color ,base2))
   (doom-modeline-bar :background green-2)

   ;; Subtle status accents
   (doom-modeline-project-dir :foreground green-1 :weight 'normal)
   (doom-modeline-buffer-modified :foreground earth :weight 'normal)

   ;; Links: GREEN (no blue)
   (link :foreground green-1 :underline t :weight 'normal)
   (link-visited :foreground green-3 :underline t :weight 'normal)

   ;; Search: green-tinted focus
   (isearch :background base3 :foreground fg :weight 'normal)
   (lazy-highlight :background base2 :foreground fg :weight 'normal)

   ;; Markdown: monochrome headers, green links
   (markdown-header-face :foreground fg :weight 'normal)
   (markdown-header-face-1 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-face-2 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-face-3 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-face-4 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-face-5 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-face-6 :foreground fg :weight 'normal :height 1.0)
   (markdown-header-delimiter-face :foreground fg :weight 'normal)
   (markdown-markup-face :foreground fg :weight 'normal)
   (markdown-inline-code-face :foreground fg :background bg-alt)
   (markdown-pre-face :foreground fg)
   (markdown-code-face :foreground fg :background bg-alt)
   (markdown-list-face :foreground fg :weight 'normal)
   (markdown-bold-face :foreground fg :weight 'normal)
   (markdown-italic-face :foreground fg :slant 'normal)
   (markdown-link-face :foreground green-1 :underline t :weight 'normal)
   (markdown-url-face :foreground green-1 :underline t :weight 'normal)

   ;; Org: monochrome titles; meta + block lines moss green
   (org-level-1 :foreground fg :weight 'normal :height 1.0)
   (org-level-2 :foreground fg :weight 'normal :height 1.0)
   (org-level-3 :foreground fg :weight 'normal :height 1.0)
   (org-level-4 :foreground fg :weight 'normal :height 1.0)
   (org-level-5 :foreground fg :weight 'normal :height 1.0)
   (org-level-6 :foreground fg :weight 'normal :height 1.0)
   (org-level-7 :foreground fg :weight 'normal :height 1.0)
   (org-level-8 :foreground fg :weight 'normal :height 1.0)
   (org-document-title :foreground fg :weight 'normal :height 1.0)
   (org-document-info :foreground fg :weight 'normal)
   (org-meta-line :foreground green-3 :weight 'normal)
   (org-block :background bg-alt :foreground fg)
   (org-block-begin-line :foreground green-3 :background bg-alt)
   (org-block-end-line :foreground green-3 :background bg-alt)
   (org-drawer :foreground fg)
   (org-special-keyword :foreground fg :weight 'normal)
   (org-tag :foreground fg :weight 'normal)
   (org-list-dt :foreground fg :weight 'normal)
   (org-link :foreground green-1 :underline t :weight 'normal)

   ;; Diagnostics: quiet but readable
   (success :foreground green-1 :weight 'normal)
   (warning :foreground earth :weight 'normal)
   (error   :foreground "#c97f6f" :weight 'normal)))

(provide-theme 'doom-volgograd)
;;; doom-volgograd-theme.el ends here
