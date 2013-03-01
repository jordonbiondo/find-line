;;; find-simple.lisp --- 
;; 
;; Filename: find-simple.lisp
;; Description: 
;; Author: Jordon Biondo
;; Maintainer: Jordon Biondo
;; Created: Fri Mar  1 11:49:06 2013 (-0500)
;; Version: .01
;; Last-Updated: Fri Mar  1 11:49:18 2013 (-0500)
;;           By: Jordon Biondo
;;     Update #: 1
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:



(defun find-lines-in-file(filename keyword &optional (print t))
  "Return number of lines in FILENAME that contain KEYWORD, if PRINT lines are printed."
  (with-open-file (myfile filename)
    (let ((line-num 1) (find-count 0))
      (loop for line = (multiple-value-list (read-line myfile nil))
	 while (not (nth 1 line)) do
	   (if (search keyword (first line))
	       (progn
		 (if print (format t "~D: ~A~%"
				   (setq line-num (1+ line-num))
				   line))
		 (setq find-count (1+ find-count)))))
      (if print (format t "Found ~D lines~%" find-count))
      find-count)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; find-simple.lisp ends here
