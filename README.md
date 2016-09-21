Evil Colemak (minimal)
======================

Colemak configuration for ```evil-mode``` with minimal adjustments.

Install
-------

This package is available from Melpa and can be installed with the
package manager (``package.el```) that comes bundled with Emacs 24+.

``` emacs-lisp
M-x package-install RET evil-colemak-minimal RET
```

Alternatively, put the Elisp file somewhere in your loading path and
load it explicitly:

``` emacs-lisp
(require 'evil-colemak-minimal)
```

Note that thir ```(require)``` is not needed when installing from
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

To enable permanently, put this in your ```init.el```:

``` emacs-lisp
(global-evil-colemak-minimal-mode)
```

When enabled, a lighter showing ```colemak``` will appear in
your mode line. If you don't like it, use ```rich-minority``` or 
```diminish``` to hide it.

Note that this package assumes that your operating system is properly
configured for the Colemak keyboard layout. It does not implement the
Colemak layout on top of a Qwerty layout.

Credits
-------

This Emacs package was templated on Wouter Bolsterlee's package
```evil-colemak-basics```, available from [https://github.com/wbolster/evil-colemak-basics](https://github.com/wbolster/evil-colemak-basics).

