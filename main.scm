(import
    (chibi time)    
    (websocket))

(define gblFd 1)

(define (init fp)   
  (ws_socket fp 8080 1))

(define (delay sec)
    (define start (current-seconds))
    (let timeloop ()    
        (if ( < (- (current-seconds) start) sec) (timeloop))))

(define (clientClose fd)
   (display (list 'closed fd))
   (newline))

(define (clientOpen fd)
    (set! gblFd fd)
    (display (list 'opened fd))   
    (newline))

(define (msgReady fd msg size type) 
    (ws_sendframe_txt gblFd msg #f)
  )

(define (main) 
    (let loop ((count 0))   
        (delay 1)    
        ;(ws_sendframe_txt gblFd (number->string count) #f)
   (loop (+ count 1))))