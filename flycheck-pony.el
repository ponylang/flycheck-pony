;;; flycheck-pony.el --- Pony support in Flycheck

;; Copyright (C) 2016 Richard M. Loveland <r@rmloveland.com>

;; Author: Richard M. Loveland <r@rmloveland.com>
;; URL: https://github.com/rmloveland/flycheck-pony
;; Keywords: tools, convenience
;; Version: 0.1

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Pony syntax checking support for Flycheck.  Runs "ponyc" in the
;; current working directory.

;; You may need to customize the location of your Pony compiler if
;; Emacs isn't seeing it on your PATH:

;; (setq flycheck-pony-executable "/usr/local/bin/ponyc")

;;; Code:

(require 'flycheck)

(defgroup flycheck-pony nil
  "Pony support for Flycheck."
  :prefix "flycheck-pony-"
  :group 'flycheck
  :link '(url-link :tag "Github" "https://github.com/rmloveland/flycheck-pony"))

(flycheck-define-checker pony
  "A Pony syntax checker using the ponyc compiler.

See URL `http://www.ponylang.org'."
  :command ("ponyc")
  :standard-input nil
  :error-patterns
  ((error line-start (file-name) ":" line ":" column
	  (zero-or-more (or digit ":")) (message) line-end))
  :modes ponylang-mode)

(add-to-list 'flycheck-checkers 'pony)

(provide 'flycheck-pony)

;;; flycheck-pony.el ends here
