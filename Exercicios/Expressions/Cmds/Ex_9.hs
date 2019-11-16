-- ======================================
-- Exercicio 9
-- ======================================


data Cmd = Atr String Exp
        |  Seq [Cmd]
    deriving Show

data Exp = Num Int
        |  Add Exp Exp
        |  Sub Exp Exp
        |  Var String
    deriving Show

type Mem = [(String,Int)]

-- ==========================
-- 9.1

c0 = Atr "x" (Add (Num 2) (Num 4))
c1 = Atr "x" (Sub (Add (Num 17) (Var "x")) (Num 20))
c2 = Atr "x" (Add (Add (Num 13) (Var "x")) (Num 7))
c3 = Seq [c0 ,c1 , c2]

consulta :: Mem -> String -> Int 
consulta [] id = 0
consulta ((id',v'):l) id = if id == id'
                            then v'
                        else 
                            consulta l id

escreve :: Mem -> String -> Int -> Mem 
escreve mem id v = (id,v):mem

avaliaExp :: Mem -> Exp -> Int
avaliaExp mem (Num x) = x
avaliaExp mem (Add e1 e2) = (avaliaExp mem e1) + (avaliaExp mem e2)
avaliaExp mem (Sub e1 e2) = (avaliaExp mem e1) - (avaliaExp mem e2)
avaliaExp mem (Var id) = consulta mem id

avaliaCmd :: Mem -> Cmd -> Mem
avaliaCmd mem (Atr id exp) = escreve mem id (avaliaExp mem exp)
avaliaCmd mem (Seq (x:xs)) = avaliaCmd (avaliaCmd mem c1) (Seq xs)  
avaliaCmd mem (Seq []) = mem

main = print (avaliaCmd [] c3)
