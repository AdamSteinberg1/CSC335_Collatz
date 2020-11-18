#!/usr/bin/sbcl --script

(defun getSequenceLength (n)
  (cond
    ((= n 1) 0)
    ((evenp n) (+ 1 (getSequenceLength (/ n 2))))
    (t (+ 1 (getSequenceLength (+ (* 3 n) 1))))
  )
)

;the function used to compare two elements in our array of 10
;first compares by sequence length then by starting number
(defun compareElems (a b)
  (cond
    ((= (nth 1 a) (nth 1 b)) (> (car a) (car b)))
    (t (< (nth 1 a) (nth 1 b)))
  )
)

;return the index of the minimum element
(defun minimum (myArray)
  (let ((min 0))
    (loop for index from 0 to (- (length myArray) 1)
      when (compareElems (aref myArray index) (aref myArray min)) ;TODO verify order
      do (setq min index)
    )
    (return-from minimum min)
  )
)

;;returns the array of the 10 smallest integers less than 5000000000 that have the longest sequence lengths
(defun getSmallestTen ()
  (let ((result (make-array '(10) :initial-element (list 0 0))) (minIndex 0) (value (list 0 0)))
    (loop for num from 1 to 4999999999;change to 4999999999
       do (setf minIndex (minimum result))
       do (setf value (list num (getSequenceLength num)))
       when (compareElems (aref result minIndex) value)
        do(setf (aref result minIndex) value)
    )
    (return-from getSmallestTen (sort result `compareElems))
  )
)


(loop for elem across (getSmallestTen)
  do (format t "~a has a sequence length of ~a~&" (nth 0 elem) (nth 1 elem))
)
