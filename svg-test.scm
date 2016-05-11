(define pi  3.1415926)

(define (circle r t) (cons (* r (cos t)) (* r (sin t))))
(define (test) 
  ((new-graph "blue" 2 "test.svg") (lambda (t) (circle 10 t)) 0 (* 2 pi)))
(test)
