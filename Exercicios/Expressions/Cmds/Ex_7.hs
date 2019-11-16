-- ======================================
-- Exercicio 7
-- ======================================


data Cmd = Atr String Exp
        |  Seq Cmd Cmd
    deriving Show

data Exp = Num Int
        |  Add Exp Exp
        |  Sub Exp Exp
        |  Var String
    deriving Show

type Mem = [(String,Int)]

-- ==========================
-- 7.1

-- c0 = Atr "x" (Num 1)
-- -- x = 1
-- c1 = Seq (Seq c0 (Atr "y" (Add (Var "x") (Num 1)))) (Atr "x" (Sub (Var "y") (Num 20)))
-- -- y = x + 1 , x = y - 20 ==> x = 1 + x - 20
-- c2 = Seq (Seq (Atr "x" (Num 1)) (Atr "y" (Num 2))) (Atr "z" (Add (Var "x") (Var "y")))
-- -- x = 1 , y = 2 ==> z = x + y

-- ==========================
-- 7.2

c0 = Atr "x" (Add (Num 1) (Num 2))
-- x = 1 + 2 ==> valor final : x = 3
c1 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))
-- x = 10 , x = 1 ==> valor final : x = 1
c2 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))
-- x = 1 , y = x + 1 , x = y ==> valor final : x = 2

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
avaliaCmd mem (Atr id exp) = escreve mem id v where
                                v = avaliaExp mem exp
avaliaCmd mem (Seq c1 c2) = avaliaCmd mem' c2 where
                                mem' = avaliaCmd mem c1

main = print (avaliaCmd [] c2)
