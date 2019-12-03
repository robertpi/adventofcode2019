
(define computer-input-string (call-with-input-file "C:\\code\\adventofcode2019\\day2\\input.txt" read-line))

(define memory (map string->number (string-split computer-input-string ",")))

(define (compute-op memory op pos)
    (let ([operand1 (list-ref memory (+ 1 pos))]
          [operand2 (list-ref memory (+ 2 pos))]
          [return-location (list-ref memory (+ 3 pos))])
         (list-set 
            memory
            return-location
            (op 
                (list-ref memory operand1)
                (list-ref memory operand2))
            )))

(define (compute-step memory pos)
    (let ((op-code (list-ref memory pos)))
        (match op-code
            [1 (let ((next-memory (compute-op memory + pos))) (compute-step next-memory (+ 4 pos)))]
            [2 (let ((next-memory (compute-op memory * pos))) (compute-step next-memory (+ 4 pos)))]
            [99 (list-ref memory 0)])))

(compute-step memory 0)
