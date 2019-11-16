-- ======================================
-- Exercicio 1
-- ======================================
    
data Exp = Num Int
        | Add Exp Exp
        | Sub Exp Exp
        | Var String
    deriving Show

data Cmd = Atr String Exp
        | Seq Cmd Cmd
        | Dcl String
        | Cnd Exp Cmd Cmd
    deriving Show


verificaExp :: [String] -> Exp -> Bool
verificaExp vars (Var var)   = elem var vars
verificaExp vars (Add e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp vars (Sub e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp _    _           = True

verificaCmd :: [String] -> Cmd -> ([String], Bool)
verificaCmd vars (Dcl var)     = (var:vars, True)
verificaCmd vars (Atr var exp) = (vars,     (elem var vars) && (verificaExp vars exp))
verificaCmd vars (Seq c1 c2)   = (v2,       b1 && b2) where
                         (v1,b1) = verificaCmd vars c1
                         (v2,b2) = verificaCmd v1   c2


p0 :: Cmd
p0 = Seq (Atr "x" (Num 10))(Seq (Atr "x" (Num 20))(Atr "y" (Var "x")))
p1 = Seq (Dcl "x") p0
p2 = Seq (Dcl "y") p1

pe = Atr "x" (Num 10)

--main = print (verificaCmd [] p2)
main = print (verificaCmd [] pe)
--main = print (avaliaCmd [] p2)