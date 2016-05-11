(define pi  3.1415926)

(define (circle r t) (cons (* r (cos t)) (* r (sin t))))
(define (translate v curve)
  (lambda (t) (let ((p (curve t))) 
    (cons 
      (+ (car v) (cdr p))
      (+ (cdr v) (cdr p))))))
(define (test) 
  ((new-graph "blue" 2 "test.svg")
   (lambda (t) 
     (transform (cons 9 -9) (circle 10 t)))
   0 (* 2 pi)))
(test)
