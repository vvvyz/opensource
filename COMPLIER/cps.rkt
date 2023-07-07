(define serial 0)

;;保证每一个变量都是唯一的
(define gensym
    (lambda (base)
        (set! serial (+ 1 serial))
        (string->symbol 
            (string-append 
                (symbol->string base)
                (number->string serial)))))