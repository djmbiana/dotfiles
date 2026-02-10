;;; doom-goplay-dark-theme.el --- Go Playground Dark -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

(def-doom-theme doom-goplay-dark
  "Go Playground dark theme - minimal, monochrome approach"

  ;; Core colors matching Go Playground
  ((bg         '("#2a3745" nil nil))  ; Exact Go Playground background
   (bg-alt     '("#242f3a" nil nil))
   (base0      '("#1a2128" "black" "black"))
   (base1      '("#242f3a" "#1e1e1e" "brightblack"))
   (base2      '("#374151" "#2e2e2e" "brightblack"))
   (base3      '("#4b5563" "#3a3a3a" "brightblack"))
   (base4      '("#6b7280" "#4e4e4e" "brightblack"))
   (base5      '("#9ca3af" "#585858" "brightblack"))
   (base6      '("#d1d5db" "#6c6c6c" "brightblack"))
   (base7      '("#e5e7eb" "#979797" "brightblack"))
   (base8      '("#f3f4f6" "#dfdfdf" "white"))
   (fg         '("#e5e7eb" "#dfdfdf" "white"))
   (fg-alt     '("#e5e7eb" "#dfdfdf" "white"))

   ;; All semantic colors map to foreground
   (grey       fg)
   (red        fg)
   (orange     fg)
   (green      fg)
   (teal       fg)
   (yellow     fg)
   (blue       '("#60a5fa" "#60a5fa" "blue"))  ; For links
   (dark-blue  fg)
   (magenta    fg)
   (violet     fg)
   (cyan       fg)
   (dark-cyan  fg)

   ;; UI elements
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
   (modeline-fg-alt          fg)
   (modeline-bg              base1)
   (modeline-bg-inactive     base1)
   (modeline-fg-inactive     fg))

  ;;;; Base theme face overrides
  ((default :background bg :foreground fg)

   ;; ALL text same bright color
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

   ;; Markdown headers - all white
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
   ;; Markdown links - readable blue
   (markdown-link-face :foreground blue :underline t :weight 'normal)
   (markdown-url-face :foreground blue :underline t :weight 'normal)

   ;; Org mode headers - all white
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
   (org-meta-line :foreground fg :weight 'normal)
   (org-block :background bg-alt :foreground fg)
   (org-block-begin-line :foreground fg :background bg-alt)
   (org-block-end-line :foreground fg :background bg-alt)
   (org-drawer :foreground fg)
   (org-special-keyword :foreground fg :weight 'normal)
   (org-tag :foreground fg :weight 'normal)
   ;; Org list definition terms - white
   (org-list-dt :foreground fg :weight 'normal)
   ;; Org links - readable blue
   (org-link :foreground blue :underline t :weight 'normal)

   ;; Line numbers
   (line-number :foreground base4 :background bg)
   (line-number-current-line :foreground fg :background bg-alt :weight 'normal)

   ;; UI elements
   (cursor :background fg)
   (hl-line :background base1)
   (region :background base3)
   (highlight :background base2)
   (vertical-border :foreground base2)
   (fringe :background bg :foreground base4)
   (shadow :foreground fg)

   ;; Modeline
   (mode-line :background base1 :foreground fg)
   (mode-line-inactive :background base1 :foreground fg)
   (mode-line-emphasis :foreground fg :weight 'normal)
   (doom-modeline-buffer-file :foreground fg :weight 'normal)
   (doom-modeline-buffer-modified :foreground fg :weight 'normal)
   (doom-modeline-project-dir :foreground fg :weight 'normal)

   ;; Minibuffer
   (minibuffer-prompt :foreground fg :weight 'normal)

   ;; Links (general)
   (link :foreground blue :underline t :weight 'normal)
   (link-visited :foreground blue :underline t :weight 'normal)

   ;; Search
   (isearch :background base3 :foreground fg :weight 'normal)
   (lazy-highlight :background base2 :foreground fg :weight 'normal)))

(provide-theme 'doom-goplay-dark)
;;; doom-goplay-dark-theme.el ends here
