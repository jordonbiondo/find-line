#!/sw/bin/sbcl --script

;;quick list set up hack
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;; regexp package
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

