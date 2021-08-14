(import
    (chibi time)    
    (websocket))

(define gblFd 1)
(define port 8080)
(define nonblocking 1)

(define (init fp)   
  (ws_socket fp port nonblocking))

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

(define (ws_send_txt msg)
    (ws_sendframe_txt gblFd msg #f)
    (display (list 'frame 'sent 'client gblFd))
    (newline))


(define (msgReady fd msg size type)    
    (display (list 'frame 'recieved 'client fd))
    (newline)
    (ws_send_txt msg)) ;echo

(define (main) 
    (let loop ((count 0))   
        (delay 1)                
   (loop (+ count 1))))