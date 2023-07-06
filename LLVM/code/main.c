#include <stdio.h>

typedef char* string;
typedef struct A_stem_ *A_stm;
typedef struct A_expList_ *A_exp;

typedef struct {A_plus, A_minus, A_tims}

struct A_stem_ {
    //表示类型
    enum { A_stm} kind;

    //表示值
    union {
        struct {A_stm stm1, stm2};
    } u;
    
};

typedef struct A_exp_ *A_exp;

struct A_exp_ {
    //表示类型
    enum {
        A_idExp, A_numExp, 
    };

    union {
        string id;
        int num;
        struct {A_exp left; A_binop oper, A_exp}
    } ;
};
