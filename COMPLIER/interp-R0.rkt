#lang racket

(define interp
    (lambda (e)
        (match e
            
            [(Int n) n]
            
            [(Prim 'read '())
                (define r (read))
                (cond [(fixnum? r) r]
                      [else (error 'interp-r1 "expected an integer" r)])]
            
            [(Prim '- (list e))
                (define v (interp e))
                (fx- 0 v)]

            [(Prim '+ (list e1 e2))
                (define v1 (interp e1))
                (define v2 (interp e2))]
                (fx+ v1 v2))))

(define interp-R0 
    (lambda (p)
        (match p
            [(Program info e) (interp e)])))

