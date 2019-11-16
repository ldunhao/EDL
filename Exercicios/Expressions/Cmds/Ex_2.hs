-- ======================================
-- Exercicio 2
-- ======================================

data Exp = Num Int
        |  Add Exp Exp
        |  Sub Exp Exp
        |  Mul Exp Exp
        |  Div Exp Exp
    deriving Show

e0 = Mul (Num 1) (Num 2)
e1 = Mul (Div (Add (Num 4) (Num 4)) (Num 2)) (Num 2)
e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4)))
e3 = Sub (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4)
e4 = Sub (Num 1) (Sub (Num 2) (Sub (Num 3) (Num 4)))
e5 = Sub (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4))

avalia :: Exp -> Int
avalia (Num x) = x
avalia (Add e1 e2) = avalia e1 + avalia e2
avalia (Sub e1 e2) = avalia e1 - avalia e2
avalia (Mul e1 e2) = avalia e1 * avalia e2
avalia (Div e1 e2) = avalia e1 `div` avalia e2

temp :: Int -> Exp
temp x = Num x

avalia' :: Exp -> Exp
avalia' (Num x) = (Num x)
avalia' (Add a1 a2) = temp (avalia a1 + avalia a2)
avalia' (Sub a1 a2) = temp (avalia a1 - avalia a2) 
avalia' (Mul a1 a2) = temp (avalia a1 * avalia a2) 
avalia' (Div a1 a2) = temp (avalia a1 `div` avalia a2) 



main = print (avalia e1)