正确的编译器:
```java
complie:     p -> x86 -> 42
interperter: p -> 42
```

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

reg : rsp ;;堆栈指针 
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
      | popq arg       ;;弹出栈
      | retq

prog : .globl main
            main: instr^{+}
```


```racket
(+ 10 32)


=>
;;到时候就照这个写
    .global main
main:
    movq $10, $rax
    addq $32, $rax
    movq %rax, %rdi
    callq print_int
    movq $0, %rax
    retq
```


编译器就是从一种编程语言转化成为另外一种编程语言
所有我们最开始应该比较两者的区别


uniquify: 重命名变量
variables shadowing <-> register addresses
not unique <-> unique


remove-complex-opera*: 通过引入临时变量来确保每个子表达式都是原子的
+               <->  addq
sub-expression       atomic args
```racket
(+ 10 (+ 1 2))

addq $10 %rax
```

select-instructions: 将每个R1操作转化一系列指令
+ <-> addq


explicate-controal: 从AST转化为控制流
两种求值顺序的不同
left  <-> jump


assign-home: 将变量替换成堆栈位置

variables <-> register 16
unbound <--> memory unbounded


此pass为每个变量提供唯一的名称, 因此variable shadowing和scope就变得不重要了。

如果

```racket
(let ([x 32])
    (let ([y 10])
        (+ x y)))

(let ([x.1 32])
    (let ([y.1 10])
        (+ x.1 y.2)))

;;over shadowing
(let ([x 32])
    (+ (let ([x 10]) x) x))
```

在编译器中"gensym"是一种用于生成唯一标识符的技术。它通常用于编译器的内部实现，用于创建临时变量、重命名变量或生成其他唯一的符号名称。

删除复杂的运算符和操作数

```racket
(+ (+ 42 10) (- 10))

=>
(let ([tmp.1 (+ 42 10)])
    (let ([tmp.2 (- 10)])
        (+ tmp.1 tmp.2)))
```
