;;((new-graph black 2 "a.svg") r a b) ;; r returns an x,y pair for t	
(define (write-svg graphics port)
  (display "<?xml version=\"1.0\"?> <svg xmlns=\"http://www.w3.org/2000/svg\">" port) (graphics port) (display "</svg>" port))
(define (write-line x1 y1 x2 y2 color width port)
  (display "<line x1=\"" port) (write x1 port) (display "\"" port) (newline port)
  (display "x2=\"" port) (write x2 port) (display "\"" port) (newline port)
  (display "y2=\"" port) (write y2 port) (display "\"" port) (newline port)
  (display "y1=\"" port) (write y1 port) (display "\"" port) (newline port)
  (display "stroke-width=\"" port) (write width port) (display "\"" port)
  (display " stroke=\"" port) (display color port) (display "\"" port)
  (display "/>" port)  (newline port))
(define (write-lines color width lines port)
  (if (pair? lines) 
    (write-line (caar lines) (cadar lines) (caddar lines) (cadddr (car lines)) color width port))
  (if (pair? lines) 
    (write-lines color width (cdr lines) port)))
  ;;(display lines port))
(define (add-line lines x1 y1 x2 y2)
 (cons (list x1 y1 x2 y2)  lines))
(define (new-graph color width file)
  (define port (open-output-file file))
  (lambda (c ta tb)
   (write-svg (lambda (p) (write-lines color width (curvi c ta tb '() ta 0.1) p)) port)))
(define (curvi curve a b lines t i)
  ;;(display t)(newline)
  (if (>= t b) lines
    (curvi curve a b (add-line lines (car (curve t)) (cdr (curve t)) (car (curve (+ t i))) (cdr (curve (+ t i)))) (+ t i) i)))
