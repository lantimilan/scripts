;; insert date
(global-set-key (kbd "C-c d") 'insert-date)

(defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%m/%d/%Y")
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%A, %d. %B %Y")))
          (system-time-locale "en_US"))
      (insert (format-time-string format))))

;; insert file name
(defun insert-buffer-file-name ()
  "Inserts the name of the file for the current buffer."
  (interactive)
  (if buffer-file-name
      (insert (file-name-nondirectory buffer-file-name))
    (message "No file associated with buffer.")))

(global-set-key (kbd "C-c i f") 'insert-buffer-file-name)