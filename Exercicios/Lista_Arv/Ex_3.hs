
-- ======================================
-- Exercicio 3
-- ======================================

data Arvore = Folha Int | Galho (Arvore) (Arvore)   
  deriving Show

a1 = Galho (Folha 15) (Folha 12)
a2 = Galho (Galho (Folha 3) (Folha 4)) (Galho (Folha 1) (Folha 6))

-- ==========================
-- 3.1

folhas :: Arvore -> Int
folhas (Folha n) = 1
folhas (Galho a1 a2) = folhas a1 + folhas a2

-- ==========================
-- 3.2

altura :: Arvore  -> Int
altura (Folha n) = 0
altura (Galho a1 a2) = 1 + maior (altura a1) (altura a2)
  where 
    maior :: Int -> Int -> Int
    maior x y = if x > y then x else y

-- ==========================
-- 3.3

espelho :: Arvore -> Arvore
espelho (Folha n) = Folha n
espelho (Galho a1 a2) = (Galho a2 a1)

-- ==========================
-- 3.4

soma :: Arvore -> Int
soma (Folha n) = n
soma (Galho a1 a2) = soma a1 + soma a2

-- ==========================
-- 3.5

dobra :: Arvore -> Arvore
dobra (Folha n) = Folha (2*n)
dobra (Galho a1 a2) = (Galho (dobra a1) (dobra a2))

-- ==========================
-- 3.6

possui :: Arvore -> Int -> Bool
possui (Folha x) n = n == x
possui (Galho a1 a2) n = (possui a1 n) || (possui a2 n)

-- ==========================
-- 3.7

maximo :: Arvore -> Int
maximo (Folha x) = x
maximo (Galho a1 a2) = if (maximo a1) > (maximo a2) then (maximo a1) else (maximo a2)

-- ==========================
-- 3.8

insere :: Arvore -> Int -> Arvore
insere (Folha x) val = if (val > x) then (Galho (Folha x) (Folha val)) else (Galho (Folha val) (Folha x))
insere (Galho a1 a2) val = (Galho (insere a1 val) (insere a2 val))


main = print (insere a2 8)