// ======================================
// Exercicio 3
// ======================================

#include <stdio.h>


struct Exp {
    enum tipo {
        Num, Add, Sub
    }type;

    union {
        int val;
        struct {
            struct Exp *exp1, *exp2;
        };
    };
    
};

int avalia(struct Exp e){
    switch(e.type){
        case Num:
            return e.val;
            break;
        case Add:
            return avalia(*(e.exp1)) + avalia(*(e.exp2));
            break;
        case Sub:
            return avalia(*(e.exp1)) - avalia(*(e.exp2));
            break;
        default:
            break;
    }
}

int main(void){

    struct Exp num1, num2, num3, soma, sub;
    num1.type = 0, num1.val = 1;
    num2.type = 0, num2.val = 2;
    num3.type = 0, num3.val = 5;
    soma.type = 1, soma.exp1 = &num1, soma.exp2 = &num2;
    sub.type = 2, sub.exp1 = &soma, sub.exp2 = &num3;
    printf("%d\n", avalia(soma));
    
    return 0;
}
