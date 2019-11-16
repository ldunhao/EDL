-- ======================================
-- Exercicio 8
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


-- c0 = Atr "x" (Add (Num 1) (Num 2))
c1 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))
c2 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))

-- ==========================
-- 8.1

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


avaliaProg :: Cmd -> Int
avaliaProg cmd = avaliaExp (avaliaCmd [] cmd) (Var "ret")

c0 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Num 2)) (Atr "ret" (Add (Var "x") (Var "y"))))


main = print (avaliaProg c0)