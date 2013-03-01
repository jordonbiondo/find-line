#!/sw/bin/sbcl --script
;;; find-line.lisp --- 
;; 
;; Filename: find-line.lisp
;; Description: 
;; Author: Jordon Biondo
;; Maintainer: Jordon Biondo
;; Created: Fri Mar  1 11:50:02 2013 (-0500)
;; Version: 
;; Last-Updated: Fri Mar  1 11:50:19 2013 (-0500)
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




(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
(require :cl-ppcre)


;; main
(defun main()
  "Prints all lines in a file that match a regexp"
  (if (not (>= (length *posix-argv*) 3))
      (format t "Usage: findline <filename> <regexp>~C" #\linefeed)
      (with-open-file (dictionary (nth 1 *posix-argv*))
	(loop for line = (multiple-value-list (read-line dictionary nil))
	   while (not (nth 1 line)) do 
	     (let ((values 
		    (multiple-value-list(cl-ppcre:scan (nth 2 *posix-argv*) (car line)))))
	       (if (car values)
		   (if (and (= 0 (car values)) (= (length (car line)) (nth 1 values)))
		       (print (car line))))))))
  (format t "~C" #\linefeed))

(main)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; find-line.lisp ends here
