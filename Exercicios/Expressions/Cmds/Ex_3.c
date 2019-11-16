// ======================================
// Exercicio 3
// ======================================

#include <stdio.h>


struct Exp {
    enum tipo {
        Num, Add, Sub
    }type;

    union valores {
        int val;
        struct Exp *exp1, *exp2;
    }valores;
    
};

int avalia(struct Exp e){
    switch(e.type){
        case Num:
            return e.valores.val;
            break;
        case Add:
            return avalia(*(e.valores.exp1)) + avalia(*(e.valores.exp2));
            break;
        case Sub:
            return avalia(*(e.valores.exp1)) - avalia(*(e.valores.exp2));
            break;
        default:
            break;
    }
}

int main(void){
    struct Exp e1, e2, e3, num1, num2;
    // Types: 0 = Num, 1 = Soma, 2 = Sub
    e1.type = 0; e1.valores.val = 1;
    num1.type = 0; num1.valores.val = 2;
    num2.type = 0; num2.valores.val = 5;
    e2.type = 1; e2.valores.exp1 = &num2; e2.valores.exp2 = &num1;
    e3.type = 1; e3.valores.exp1 = &e1; e3.valores.exp2 = &e2;
    printf("%d\n", avalia(e3));
    
    return 0;
}