-- ======================================
-- Exercicio 1
-- ======================================

-- data Arvore = Folha | Galho Arvore Arvore 
--   deriving Show

-- a1 = Galho ( Galho Folha Folha) (Galho Folha Folha)
-- a2 = Galho ( Galho ( Galho Folha Folha) Folha) Folha
-- a3 = Galho Folha ( Galho (Galho Folha Folha) (Galho Folha Folha))
-- a4 = Folha

-- ==========================
-- 1.1

-- folhas:: Arvore -> Int
-- folhas Folha = 1
-- folhas (Galho a1 a2) = folhas a1 + folhas a2

-- -- ==========================
-- -- 1.2

-- altura:: Arvore -> Int
-- altura Folha = 0
-- altura (Galho a1 a2) = 1 + maior (altura a1) (altura a2)
--   where 
--     maior :: Int -> Int -> Int
--     maior x y= if x> y then x else y

-- -- ==========================
-- -- 1.3

-- espelho:: Arvore -> Arvore
-- espelho Folha = Folha
-- espelho (Galho a1 a2)= (Galho (espelho a2) (espelho a1))


-- ======================================
-- Exercicio 2
-- ======================================

data Arvore  = Folha | Galho Int (Arvore) (Arvore)   
  deriving Show

a0 = Galho 10 Folha Folha
a1 = Galho 10 a0 a0
a2 = Galho 1 ( Galho 0 ( a0) Folha) Folha
a3 = Galho 2 Folha ( Galho 3 (a0) (a0))
a4 = Galho 4 (Galho 2 Folha Folha) (Galho 6 Folha Folha)

folhas :: Arvore -> Int
folhas Folha = 1
folhas (Galho _ a1 a2) = folhas a1 + folhas a2

altura :: Arvore  -> Int
altura Folha = 0
altura (Galho _ a1 a2) = 1 + maior (altura a1) (altura a2)
  where 
    maior :: Int -> Int -> Int
    maior x y = if x > y then x else y

espelho :: Arvore -> Arvore
espelho Folha = Folha
espelho (Galho x a1 a2) = (Galho x a2 a1)

-- ==========================
-- 2.1

soma :: Arvore -> Int
soma Folha = 0
soma (Galho x a1 a2) = x + soma a1 + soma a2

-- ==========================
-- 2.2

dobra :: Arvore -> Arvore
dobra Folha = Folha
dobra (Galho x a1 a2) = (Galho (2*x) (dobra a1) (dobra a2))

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

insere :: Arvore -> Int -> Arvore
insere Folha x = Folha
insere (Galho x a1 a2) n = 
  if (n > x && n < valor(a2)) then (Galho x a1 (Galho n Folha a2)) -- Insere entre o no atual e o nó seguinte da DIREITA 
  else if (n < x && n > valor(a1)) then (Galho x (Galho n a1 Folha) a2) -- Insere entre o no atual e o nó seguinte da ESQUERDA
  else if (n < x && n < valor(a1)) then (Galho x (insere a1 n) a2) 
  else if (n > x && n < valor2(a1)) then (Galho x a1 (insere a2 n)) 
  else (Galho x (insere a1 n) (insere a2 n))
    where 
      valor :: Arvore -> Int
      valor Folha = -1
      valor (Galho x a1 a2) = x -- Retorna o valor do no

      valor2 :: Arvore -> Int
      valor2 Folha = 10000
      valor2 (Galho x a1 a2) = x
      
-- ======================================
-- Exercicio 3
-- ======================================

data ArvoreF = FolhaF Int | GalhoF (ArvoreF) (ArvoreF)   
  deriving Show

a5 = GalhoF (FolhaF 15) (FolhaF 12)
a6 = GalhoF (GalhoF (FolhaF 3) (FolhaF 4)) (GalhoF (FolhaF 1) (FolhaF 6))

-- ==========================
-- 3.1

folhasF :: ArvoreF -> Int
folhasF (FolhaF n) = 1
folhasF (GalhoF a1 a2) = folhasF a1 + folhasF a2

-- ==========================
-- 3.2

alturaF :: ArvoreF  -> Int
alturaF (FolhaF n) = 0
alturaF (GalhoF a1 a2) = 1 + maior (alturaF a1) (alturaF a2)
  where 
    maior :: Int -> Int -> Int
    maior x y = if x > y then x else y

-- ==========================
-- 3.3

espelhoF :: ArvoreF -> ArvoreF
espelhoF (FolhaF n) = FolhaF n
espelhoF (GalhoF a1 a2) = (GalhoF a2 a1)

-- ==========================
-- 3.4

somaF :: ArvoreF -> Int
somaF (FolhaF n) = n
somaF (GalhoF a1 a2) = somaF a1 + somaF a2

-- ==========================
-- 3.5

dobraF :: ArvoreF -> ArvoreF
dobraF (FolhaF n) = FolhaF (2*n)
dobraF (GalhoF a1 a2) = (GalhoF (dobraF a1) (dobraF a2))

-- ==========================
-- 3.6

possuiF :: ArvoreF -> Int -> Bool
possuiF (FolhaF x) n = n == x
possuiF (GalhoF a1 a2) n = (possuiF a1 n) || (possuiF a2 n)

-- ==========================
-- 3.7

maximoF :: ArvoreF -> Int
maximoF (FolhaF x) = x
maximoF (GalhoF a1 a2) = if (maximoF a1) > (maximoF a2) then (maximoF a1) else (maximoF a2)

-- ======================================
-- Exercicio 4
-- ======================================

data ArvoreG a = GalhoG a (ArvoreG a) (ArvoreG a) | FolhaG
  deriving Show

a10 = GalhoG 10 FolhaG FolhaG
a7 = GalhoG 5 (GalhoG 3 FolhaG (GalhoG 2 FolhaG (GalhoG 1 FolhaG a10))) a10
a8 = GalhoG 1 a10 a10

-- ==========================
-- 4.1

folhasG :: ArvoreG a -> Int
folhasG FolhaG = 1
folhasG (GalhoG _ a1 a2) = folhasG a1 + folhasG a2

-- ==========================
-- 4.2

alturaG :: ArvoreG a -> Int
alturaG FolhaG = 0
alturaG (GalhoG _ a1 a2) = 1 + maior (alturaG a1) (alturaG a2)
  where 
    maior :: Int -> Int -> Int
    maior x y = if x > y then x else y

-- ==========================
-- 4.3

espelhoG :: ArvoreG a -> ArvoreG a
espelhoG FolhaG = FolhaG
espelhoG (GalhoG x a1 a2) = (GalhoG x a2 a1)

-- ==========================
-- 4.4

somaG :: Num a => ArvoreG a -> a
somaG FolhaG = 0
somaG (GalhoG x a1 a2) = x + somaG a1 + somaG a2

-- ==========================
-- 4.5

dobraG :: Num a => ArvoreG a -> ArvoreG a
dobraG FolhaG = FolhaG
dobraG (GalhoG x a1 a2) = (GalhoG (2*x) (dobraG a1) (dobraG a2))

-- ==========================
-- 4.6

possuiG :: Ord a => ArvoreG a -> a -> Bool
possuiG FolhaG x = False
possuiG (GalhoG x a1 a2) n = if n == x then True else if (possuiG a1 n) then True else (possuiG a2 n)

main = print (possuiG a7 4)
