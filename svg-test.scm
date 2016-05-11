(define pi  3.1415926)

(define (circle r t) (cons (* r (cos t)) (* r (sin t))))
(define (test) 
  ((new-graph "black" 2 "test.svg") (lambda (t) (circle 1 t)) 0 (* 2 pi)))
