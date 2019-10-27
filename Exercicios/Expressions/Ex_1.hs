-- ======================================
-- Exercicio 1
-- ======================================

data Exp = Num Int
        |  Add Exp Exp
        |  Sub Exp Exp
    deriving Show

-- ==========================
-- 1.1

-- e0 = Num 1
-- e1 = Add (Num 1) (Sub (Num 10) (Num 20))
-- e2 = Add (Sub (Num 10) (Num 20)) (Num 1) 
-- e3 = Sub (Add (Num 5) (Num 5)) (Sub (Num 5) (Num 5))

conta :: Exp -> Int
conta (Num x) = x
conta (Add e1 e2) = conta e1 + conta e2
conta (Sub e1 e2) = conta e1 - conta e2

-- ==========================
-- 1.2

e0 = Add (Num 1) (Num 2)
e1 = Add (Add (Add (Num 1) (Num 2)) (Num 3)) (Num 4)
e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4)))
e3 = Sub (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4)
e4 = Sub (Num 1) (Sub (Num 2) (Sub (Num 3) (Num 4)))
e5 = Sub (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4))

imprime :: Exp -> String
imprime (Num x) = show x
imprime (Add e1 e2) = "(" ++ imprime e1 ++ " + " ++ imprime e2 ++ ")"
imprime (Sub e1 e2) = "(" ++ imprime e1 ++ " - " ++ imprime e2 ++ ")"

avalia :: Exp -> Int
avalia (Num x) = x
avalia (Add e1 e2) = avalia e1 + avalia e2
avalia (Sub e1 e2) = avalia e1 - avalia e2

temp :: Int -> Exp
temp x = Num x

avalia' :: Exp -> Exp
avalia' (Num x) = (Num x)
avalia' (Add a1 a2) = temp (avalia a1 + avalia a2)
avalia' (Sub a1 a2) = temp (avalia a1 - avalia a2)

main = print (avalia' e1)