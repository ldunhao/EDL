// ======================================
// Exercicio 4
// ======================================

 
abstract class Exp {
    abstract int avalia();

    public static class Num extends Exp {
        int n;

        Num(int n){
            this.n = n;
        }

        int avalia(){
            return this.n;
        }
    }

    public static class Add extends Exp {
        Exp e1, e2;

        Add(Exp e1, Exp e2){
            this.e1 = e1;
            this.e2 = e2;
        }

        int avalia(){
            return e1.avalia() + e2.avalia();
        }
    }

    public static class Sub extends Exp {
        Exp e1, e2;

        Sub(Exp e1, Exp e2){
            this.e1 = e2;
            this.e2 = e2;
        }

        int avalia(){
            return e1.avalia() - e2.avalia();
        }
    }
}

class Ex_4 {
    public static void main(String[] args){
        Exp e1 = new Exp.Num(1);
        Exp e2 = new Exp.Num(2);
        Exp e3 = new Exp.Num(5);

        Exp add = new Exp.Add(e1, e2);
        Exp sub = new Exp.Sub(add, e3);

        System.out.println(add.avalia());
    }
}