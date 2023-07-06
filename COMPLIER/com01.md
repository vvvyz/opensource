

```syntax
exp : int 
    | (read) 
    | (- exp)
    | (+ exp exp)
    | (- exp exp)
R0 ::= exp


exp : (Int int)
    | (Prim 'read '())
    | (Prim '- (list exp))
    | (Prim '+ (list exp exp))
    | var
    | (let ([var exp]) exp)
R0 : (Program '() exp)

reg : rsp 
    | rbq
    | rsi
    | rdi
    | rax
    | ...
    | rdx
    | r8
    | ...
    | r15

arg : $int
    | %reg
    | int(%reg)

instr : addq arg, arg
      | subq arg, arg
      | negq arg
      | movq arg, arg
      | callq label
      | pushq arg
      | popq arg
      | retq

prog : .globl main
            main: instr^{+}
```


```racket
(+ 10 32)

=>
    .global main
main:
    movq $10, $rax
    addq $32, $rax
    movq %rax, %rdi
    callq print_int
    movq $0, %rax
    retq
```


select-instructions: 将每个R1操作转化一系列指令
remove-complex-opera*: 通过引入临时变量来确保每个子表达式都是原子的

explicate-controal: 从AST转化为控制图
assign-home: 将变量替换成堆栈位置
uniquify: 重命名变量