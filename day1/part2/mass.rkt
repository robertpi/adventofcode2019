(define (next-line-it acc file)
  (let ((line (read-line file 'any)))
    (if (eof-object? line)
      acc
      (next-line-it (cons line acc) file))))

(define masses (call-with-input-file "C:\\code\\adventofcode2019\\day1\\input.txt"  (lambda (in) (next-line-it '() in))))

(define (calculate-fuel-mass mass)
  (let ((next-mass (- (quotient mass  3) 2))) 
    (if (> next-mass 0) 
      (+ next-mass (calculate-fuel-mass next-mass))
      0)))

(define fuel 
    (map (lambda (i) 
            (let ((mass (string->number i))) (calculate-fuel-mass mass )))
            masses))

(foldr + 0 fuel)

