-- ======================================
-- Exercicio 1
-- ======================================

-- data Arvore = Folha | Galho Arvore Arvore 
--   deriving Show

-- a1= Galho ( Galho Folha Folha) (Galho Folha Folha)
-- a2= Galho ( Galho ( Galho Folha Folha) Folha) Folha
-- a3= Galho Folha ( Galho (Galho Folha Folha) (Galho Folha Folha))
-- a4=Folha

-- ==========================
-- 1.1

-- folhas:: Arvore -> Int
-- folhas Folha = 1
-- folhas (Galho a1 a2) = folhas a1+ folhas a2

-- -- ==========================
-- -- 1.2

-- altura:: Arvore -> Int
-- altura Folha = 0
-- altura (Galho a1 a2) = 1 + maior (altura a1) (altura a2)
--   where 
--     maior:: Int -> Int -> Int
--     maior x y= if x> y then x else y

-- -- ==========================
-- -- 1.3
-- espelho:: Arvore -> Arvore
-- espelho Folha= Folha
-- espelho (Galho a1 a2)= (Galho (espelho a2) (espelho a1))


-- ======================================
-- Exercicio 2
-- ======================================

data Arvore= Folha | Galho Int (Arvore) (Arvore)   
  deriving Show

a0 = Galho 10 Folha Folha
a1 = Galho 10 a0 a0
a2 = Galho 1 ( Galho 0 ( a0) Folha) Folha
a3 = Galho 3 Folha ( Galho 2 (a0) (a0))
a4 = Folha

folhas :: Arvore -> Int
folhas Folha = 1
folhas (Galho _ a1 a2) = folhas a1+ folhas a2

altura :: Arvore  -> Int

altura Folha = 0
altura (Galho _ a1 a2) = 1 + maior (altura a1) (altura a2)
  where 
    maior :: Int -> Int -> Int
    maior x y= if x> y then x else y

espelho :: Arvore -> Arvore
espelho Folha = Folha
espelho (Galho x a1 a2)  = (Galho x a2 a1)

-- ==========================
-- 2.1

soma :: Arvore -> Int
soma Folha = 0
soma (Galho x a1 a2)= x + soma a1 + soma a2

-- ==========================
-- 2.2

dobra :: Arvore -> Arvore
dobra Folha = Folha
dobra (Galho x a1 a2)= (Galho (n x) (dobra a1) (dobra a2))
  where 
  n :: Int -> Int
  n x = 2*x

-- ==========================
-- 2.3

-- possui :: Arvore -> Int -> Bool
-- possui Folha x = False
-- possui (Galho x a1 a2) n = if n == x then True else if (possui a1 n) then True else (possui a2 n)

-- ==========================
-- 2.4.1

possui :: Arvore -> Int -> Bool
possui Folha x = False
possui (Galho x a1 a2) n = if n == x then True else if n < x then (possui a1 n) else (possui a2 n)

-- ==========================
-- 2.4.2

maximo :: Arvore -> Int
maximo Folha = 0
maximo (Galho x a1 a2) = maior (Galho x (a1) (a2)) (maximo a2)
  where 
  maior :: Arvore -> Int -> Int
  maior (Galho x _ _) y = if x > y then x else y

-- ==========================
-- 2.4.3

-- insere :: Arvore -> Int -> Arvore
-- insere Folha = 0
-- insere (Galho x a1 a2) n = 
--   where 
--     ehmenor :: Int -> Int -> Arvore
--     ehmenor z w = if z > w then (Galho z a1 a2) else (Galho w a1 a2)

-- ======================================
-- Exercicio 3
-- ======================================

-- ==========================
-- 3.1


main = print (possui a3 7)
