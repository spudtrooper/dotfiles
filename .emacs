(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
	))
(package-initialize)

(setq c-basic-offset 2)
(setq js-indent-level 2)
(setq python-indent-offset 2)
(setq pug-tab-width 2)
(setq jsx-indent-level 2)
(setq sh-basic-offset 2)
(setq css-indent-offset 2)

(invert-face 'default)
