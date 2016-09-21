;;; evil-colemak-minimal.el --- Minimal Colemak key bindings for evil-mode

;; Author: Bryan Allred <bryan@revolvingcow.com>
;; Version: 1.0.0
;; Package-Requires: ((emacs "24") (evil "1.2.12"))
;; Keywords: colemak evil
;; URL: https://github.com/bmallred/evil-colemak-minimal
;;
;; This file is not part of GNU Emacs.

;;; License:

;; Licensed under the same terms as Emacs.

;;; Commentary:

;; This package provides minimal key rebindings for evil-mode with the
;; Colemak keyboard layout.  See the README for more information.
;;
;; To enable globally, use:
;;
;;   (global-evil-colemak-minimal-mode)
;;
;; To enable for just a single buffer, use:
;;
;;   (evil-colemak-minimal-mode)

;;; Code:

(require 'evil)

;;;###autoload
(define-minor-mode evil-colemak-minimal-mode
  "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
  :keymap (make-sparse-keymap)
  :lighter " colemak")

;;;###autoload
(define-globalized-minor-mode global-evil-colemak-minimal-mode
  evil-colemak-minimal-mode
  (lambda () (evil-colemak-minimal-mode t))
  "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")

(evil-define-minor-mode-key
  'motion 'evil-colemak-minimal-mode
  ;; Left, Down, Up, Right
  "s" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "t" 'evil-forward-char

  ;; (H)op to next/previous search
  "h" 'evil-search-next
  "H" 'evil-search-previous

  ;; (L)ast character in word/WORD
  "l" 'evil-forward-word-end
  "L" 'evil-forward-WORD-end
  
  ;; (K)in of character
  "k" 'evil-find-char-to
  "K" 'evil-find-char-to-backward)

(evil-define-minor-mode-key
  'normal 'evil-colemak-minimal-mode
  ;; Left, Down, Up, Right
  "s" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "t" 'evil-forward-char)

(evil-define-minor-mode-key
  'visual 'evil-colemak-minimal-mode
  ;; Left, Down, Up, Right
  "s" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "t" 'evil-forward-char)

(evil-define-minor-mode-key
  'operator 'evil-colemak-minimal-mode
  ;; Left, Down, Up, Right
  "s" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "t" 'evil-forward-char)

(evil-define-minor-mode-key
  'window 'evil-colemak-minimal-mode
  ;; Left, Down, Up, Right
  "s" 'evil-window-left
  "n" 'evil-window-down
  "e" 'evil-window-up
  "t" 'evil-window-right

  ;; Move windows
  "S" 'evil-window-move-far-left
  "N" 'evil-window-move-very-bottom
  "E" 'evil-window-move-very-top
  "T" 'evil-window-move-far-right)

(provide 'evil-colemak-minimal)

;;; evil-colemak-minimal.el ends here
