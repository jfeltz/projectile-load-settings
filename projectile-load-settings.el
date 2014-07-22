;;; projectile-load-settings.el --- Load project elisp settings from active projectile project

;; Copyright (C) 2014 John P. Feltz

;; Author: John P. Feltz <jfeltz@gmail.com>
;; Keywords: convenience

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

;; Usage example:

;; echo "(setq foobar "fizzbuzz")" > /path/to/projectile/project/settings.el

;; (add-hook 'projectile-switch-project-hook
;;   (lambda () (projectile-load-settings "settings.el"))
;; )

;;; Code:
(require 'projectile)

(defun projectile-load-settings (file)
  "Load project elisp settings file if they are found in active project root
  directory, or if in the case of undefined root directory, file is
  otherwise path resolvable."
  (interactive "senter elisp filename (in project root): ")
  (let
    ((p (concat (projectile-project-root) file)))
    (if (file-exists-p p)
      (progn 
        (load p)
        (message "%s" (concat "loaded project settings from: " file))
        nil
        )
      nil
    )
  )
  )

(provide 'projectile-load-settings)
;;; projectile-load-settings.el ends here
