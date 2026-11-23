;;; slick-cut-mode.el --- Minor mode for slick cutting of lines and regions -*- lexical-binding: t; -*-

;; Copyright 2026, Reto Hubmann

;; Author: Reto Hubmann (steckerhalter)
;; Version: 0.1
;; URL: https://github.com/steckerhalter/slick-cut-mode
;; Package-Origin: (slick-cut-mode :url "https://github.com/steckerhalter/slick-cut-mode")
;; Package-Requires: ((emacs "29.1"))
;; Keywords: editing, killing, region

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
;; along with this program; if not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; `slick-cut-mode' provides slick cutting: `slick-cut' kills the active
;; region when one is active and otherwise kills the whole current line
;; including its trailing newline.  While the mode is on, the
;; `kill-region' remap is installed, so commands like `M-w' follow the
;; same behavior.

;;; Code:

;;;; Function

(defun slick-cut ()
  "Kill the active region, or the whole current line if no region is active."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2))))

;;;; Minor mode

;;;###autoload
(define-minor-mode slick-cut-mode
  "Minor mode for slick cutting of lines and regions.
While `slick-cut-mode' is on, the `kill-region' remap is installed:
`slick-cut' kills the active region when one is active, and the
current line (including its newline) when no region is active."
  :global t
  (if slick-cut-mode
      (global-set-key [remap kill-region] #'slick-cut)
    (global-set-key [remap kill-region] nil)))

(provide 'slick-cut-mode)

;;; slick-cut-mode.el ends here
