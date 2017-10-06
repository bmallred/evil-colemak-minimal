[![MELPA](https://melpa.org/packages/evil-colemak-minimal-badge.svg)](https://melpa.org/#/evil-colemak-minimal)

Evil Colemak (minimal)
======================

Colemak configuration for `evil-mode` with minimal adjustments and a split
navigation setup.

Why?
----

When switching to the [Colemak](https://colemak.com/) keyboard layout I tried
several different Vim alternative bindings.

Remapping the default HJKL navigation keys worked but I found I fumbled more
often than was acceptable to me because my brain was trained to use the
mnemonics more than positioning.

However, not using any remapping for navigation was not comfortable either.
Leaving the home row so often defeated a lot of the benefits of the Vim
defaults.

So after analyzing the Vim defaults and comparing them to what I actually use
or didn't use I came up with a hybrid. To minimize the amount of remapping
to retain as much of the original mnemonics as possible while still keeping
navigation right under my findertips.

Install
-------

This package is available from Melpa and can be installed with the
package manager (`package.el`) that comes bundled with Emacs 24+.

``` emacs-lisp
M-x package-install RET evil-colemak-minimal RET
```

Alternatively, put the Elisp file somewhere in your loading path and
load it explicitly:

``` emacs-lisp
(require 'evil-colemak-minimal)
```

Note that thir `(require)` is not needed when installing from
Melpa.

Usage
-----

To enable globally, use:

``` emacs-lisp
M-x global-evil-colemak-minimal-mode RET
```

To enable for just a single buffer, use:

``` emacs-lisp
M-x evil-colemak-minimal-mode RET
```

To enable permanently, put this in your `init.el`:

``` emacs-lisp
(global-evil-colemak-minimal-mode)
```

When enabled, a lighter showing `colemak` will appear in
your mode line. If you don't like it, use `rich-minority` or 
`diminish` to hide it.

Note that this package assumes that your operating system is properly
configured for the Colemak keyboard layout. It does not implement the
Colemak layout on top of a Qwerty layout.

Layout
------

The basic bindings are as follows

| Key | QWERTY | Command  | New Mnemonics |
| --- | ------ | -------- | ------------- |
| n   | j      | down     |               |
| e   | k      | up       |               |
| s   | h      | left     |               |
| t   | l      | right    |               |
| l   | e      | end      | (L)ast        |
| k   | t      | towards  | (K)in         |
| h   | n      | next     | (H)op         |
| H   | N      | previous |               |

Additional convenience bindings

| Key   | QWERTY | Command             |
| ----- | ------ | ------------------- |
| C-w n | C-w j  | move down a window  |
| C-w N | C-w J  | move window down    |
| C-w e | C-w k  | move up a window    |
| C-w E | C-w k  | move window up      |
| C-w s | C-w h  | move left a window  |
| C-w S | C-w h  | move window left    |
| C-w t | C-w l  | move right a window |
| C-w T | C-w l  | move window right   |
| zM    | e      | Fold all code       |
| zm    | t      | Fold current level  |
| zR    | n      | Show all folds      |
| zr    | N      | Show current block  |

Code folding
------------

Code folding can be accomplished using `HideShow`. For example, you can turn on the `hs-minor-mode` like such:

``` emacs-lisp
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'nxml-mode-hook #'hs-minor-mode)
```

and then mapping the keys as you see fit:

``` emacs-lisp
;; Code folding
(evil-colemak-minimal-set-for-normal (kbd "zM") 'hs-hide-all)
(evil-colemak-minimal-set-for-normal (kbd "zm") 'hs-hide-level)
(evil-colemak-minimal-set-for-normal (kbd "zR") 'hs-show-all)
(evil-colemak-minimal-set-for-normal (kbd "zr") 'hs-show-block)
```

This would append the following mappings:

| Key   | QWERTY | Command             |
| ----- | ------ | ------------------- |
| zM    | e      | Fold all code       |
| zm    | t      | Fold current level  |
| zR    | n      | Show all folds      |
| zr    | N      | Show current block  |


Advanced
--------

If it is necessary to use some of the bindings in this package the keys have
been exposed.

``` emacs-lisp
;; Major keys which were replaced
(defconst evil-colemak-minimal-left "s"
  "Movement left normally mapped to 'h'")
(defconst evil-colemak-minimal-down "n"
  "Movement down normally mapped to 'j'")
(defconst evil-colemak-minimal-up "e"
  "Movement up normally mapped to 'k'")
(defconst evil-colemak-minimal-right "t"
  "Movement right normally mapped to 'l'")
(defconst evil-colemak-minimal-next "h"
  "Movement to the next/previous search result normally mapped to 'n'")
(defconst evil-colemak-minimal-end "l"
  "Movement to the end of a word normally mapped to 'e'")
(defconst evil-colemak-minimal-towards "k"
  "Movement towards a character normally mapped to 't'")
```

Also, for pairing it is easy to toggle the key layout for partners who still
use Qwerty:

``` emacs-lisp
(evil-leader/set-key "kt" 'evil-colemak-minimal-mode)
```

Credits
-------

This Emacs package was templated on [Wouter Bolsterlee](https://github.com/wbolster)'s package
`evil-colemak-basics`, available from [wbolster/evil-colemak-basics](https://github.com/wbolster/evil-colemak-basics).

