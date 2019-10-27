-- ======================================
-- Exercicio 6
-- ======================================

data Exp = Num Int
        |  Add Exp Exp
        |  Sub Exp Exp
        |  Maior Exp Exp
        |  Menor Exp Exp
        |  Equal Exp Exp
    deriving Show


-- ==========================
-- 6.1

e0 = Add (Num 1) (Num 2)
e1 = Add (Add (Add (Num 1) (Num 2)) (Num 3)) (Num 4)
e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4)))
e3 = Menor (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4)
e4 = Maior (Num 3) (Sub (Num 2) (Sub (Num 5) (Num 4)))
e5 = Equal (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4))

confere_Ma :: Int -> Int -> Int
confere_Ma x y = if x > y then 1 else 0

confere_Me :: Int -> Int -> Int
confere_Me x y = if x < y then 1 else 0

igual :: Int -> Int -> Int
igual x y = if x == y then 1 else 0

avalia :: Exp -> Int
avalia (Num x) = x
avalia (Add e1 e2) = avalia e1 + avalia e2
avalia (Sub e1 e2) = avalia e1 - avalia e2
avalia (Maior e1 e2) = confere_Ma (avalia e1) (avalia e2)
avalia (Menor e1 e2) = confere_Me (avalia e1) (avalia e2)
avalia (Equal e1 e2) = igual (avalia e1) (avalia e2)

temp :: Int -> Exp
temp x = Num x

avalia' :: Exp -> Exp
avalia' (Num x) = (Num x)
avalia' (Add a1 a2) = temp (avalia a1 + avalia a2)
avalia' (Sub a1 a2) = temp (avalia a1 - avalia a2)

main = print (avalia e4)