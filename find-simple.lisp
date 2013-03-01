;; main
(defun find-lines-in-file(filename keyword &optional (print t))
  "Prints all lines in a file that match a regexp"
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




