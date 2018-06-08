;;; package --- Summary
;;; Commentary:
;;; Code:
(defun cbl/buffer-file-name ()
  "Message the buffer-file-name of the current buffer and put it in the kill-ring."
  (interactive)
  (let ((s (file-truename (buffer-file-name))))
    (kill-new s)
    (message "%s" s)))

(defun cbl/get-current-buffer ()
  "Return the text of the current buffer as a string."
  (buffer-substring-no-properties (point-min) (point-max)))

(defun cbl/get-current-line ()
  "Return the text of the current line as a string."
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun cbl/get-previous-line ()
  "Return the text of the previous line as a string. or nil if on the first line in the buffer"
  (save-excursion (if (< -1 (forward-line -1))
		      (cbl/get-current-line))))

(defun cbl/get-next-sexp ()
  (interactive)
  (save-excursion
    (let ((begin (point)))
      (set-mark-command nil)
      (forward-sexp)
      (kill-ring-save begin (point))
      (message (format "Saved %s" (buffer-substring-no-properties begin (point)))))))

(defun cbl/chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

(defun cbl/text/indent-matching ()
  "Insert enough spaces to indent to the next column.  The next column is based on the previous line,
and is the column of the first non-space character on the previous line that is greater than the 
current column (on the current line).
Bugs: if you want to skip a column, you have to insert something, or press C-g."
  (interactive)
  (let* ((goal-column (save-excursion (previous-line)
				      (while (not (looking-at " ")) 
					(forward-char))
				      (while (looking-at " ")
					(forward-char))
				      (- (point) 
					 (point-at-bol))))
	 (goal-point (+ goal-column (point-at-bol))))
    (while (< (point) goal-point)
      (insert " "))))


(defun cbl/font-size-frob (fn amount)
  (set-face-attribute 'default nil :height (funcall fn (* amount (face-attribute 'default :height)))))

(defun cbl/font-size/increase ()
  (interactive)
  (cbl/font-size-frob 'ceiling 1.1))

(defun cbl/font-size/decrease ()
  (interactive)
  (cbl/font-size-frob 'floor 0.9))

(defun cbl/highlight-region (begin end)
  (interactive "r")
  (let ((face (hi-lock-read-face-name))
	(overlay (make-overlay begin end)))
    (overlay-put overlay 'highlight-region-overlay t)
    (overlay-put overlay 'face face))
  (set-mark-command (point)))

(defun cbl/unhighlight-region (begin end)
  (interactive "r")
  (let ((face (hi-lock-read-face-name)))
    (remove-overlays (or begin (point-min)) (or end (point-max)) 'face face))
  (set-mark-command (point)))

(defun cbl/basename ()
  (interactive)
  (replace-regexp-in-string "^.*/" "" (file-truename (buffer-file-name))))

(defun cbl/open-this-file ()
  (interactive)
  (shell-command (format "open %s" (file-truename (buffer-file-name)))))


(defun cbl/markdown/escape-underscores (start end)
  (interactive "r")
  (save-excursion
    (message "first")
    (replace-regexp "\\([a-z]\\)-\\([a-z]\\)" "\\1_\\2" nil start end))
  (save-excursion
    (message "second")
    (replace-string "_" "\\_" nil start end)))

;;; cbl.el ends here


