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

(defun evil-colemak-minimal-mode-toggle ()
  "Toggle the Colemak minimal key mappings"
  (interactive)
  (if (get 'evil-colemak-minimal-mode-toggle 'state)
      (progn
        (evil-colemak-minimal-mode -1)
        (put 'evil-colemak-minimal-mode-toggle 'state nil))
    (progn
      (evil-colemak-minimal-mode t)
      (put 'evil-colemak-minimal-mode-toggle 'state t))))

;; Helper functions to set maps
(defun evil-colemak-minimal/set-for-all (key def &optional maps)
  (unless maps
    (setq maps (list 'normal
                     'visual
                     'insert
                     'emacs
                     'motion)))
  (while maps
    (evil-define-minor-mode-key (pop maps) 'evil-colemak-minimal-mode key def)))

(defun evil-colemak-minimal/set-for-all-but-insert (key def)
  (evil-colemak-minimal/set-for-all key def (list 'normal
                                                  'visual
                                                  'emacs
                                                  'motion)))

(defun evil-colemak-minimal/set-for-all-but-insert-and-motion (key def)
  (evil-colemak-minimal/set-for-all key def (list 'normal
                                                  'visual
                                                  'emacs)))

(defun evil-colemak-minimal/set-for-normal (key def)
  (evil-colemak-minimal/set-for-all key def (list 'normal)))

;; Major keys that were replaced
(defconst left "s")
(defconst down "n")
(defconst up "e")
(defconst right "t")
(defconst next "h")
(defconst end "l")
(defconst towards "k")

;; Left, Down, Up, Right
(evil-colemak-minimal/set-for-all-but-insert left 'evil-backward-char)
(evil-colemak-minimal/set-for-all-but-insert down 'evil-next-line)
(evil-colemak-minimal/set-for-all-but-insert up 'evil-previous-line)
(evil-colemak-minimal/set-for-all-but-insert right 'evil-forward-char)

;; Window handling
;; C-w (not C-r as in Shai's mappings) prefixes window commands
(define-key evil-window-map left 'evil-window-left)
(define-key evil-window-map (upcase left) 'evil-window-move-far-left)
(define-key evil-window-map down 'evil-window-down)
(define-key evil-window-map (upcase down) 'evil-window-move-very-bottom)
(define-key evil-window-map up 'evil-window-up)
(define-key evil-window-map (upcase up) 'evil-window-move-very-top)
(define-key evil-window-map right 'evil-window-right)
(define-key evil-window-map (upcase right) 'evil-window-move-far-right)

;; (H)op to next/previous search
(evil-colemak-minimal/set-for-all-but-insert next 'evil-search-next)
(evil-colemak-minimal/set-for-all-but-insert (upcase next) 'evil-search-previous)

;; (L)ast character in word/WORD
(evil-colemak-minimal/set-for-all-but-insert end 'evil-forward-word-end)
(evil-colemak-minimal/set-for-all-but-insert (upcase end) 'evil-forward-WORD-end)

;; (K)in of character
(evil-colemak-minimal/set-for-all-but-insert towards 'evil-find-char-to)
(evil-colemak-minimal/set-for-all-but-insert (upcase towards) 'evil-find-char-to-backward)

;; Code folding
(evil-colemak-minimal/set-for-normal (kbd "zM") 'hs-hide-all)
(evil-colemak-minimal/set-for-normal (kbd "zm") 'hs-hide-level)
(evil-colemak-minimal/set-for-normal (kbd "zR") 'hs-show-all)
(evil-colemak-minimal/set-for-normal (kbd "zr") 'hs-show-block)


(provide 'evil-colemak-minimal)

;;; evil-colemak-minimal.el ends here
