
-- ======================================
-- Exercicio 4
-- ======================================

data Arvore a = Galho a (Arvore a) (Arvore a) | Folha
  deriving Show

a1 = Galho 10 Folha Folha
a2 = Galho 5 (Galho 3 Folha (Galho 2 Folha (Galho 1 Folha a1))) a1
a3 = Galho 1 a1 a1

-- ==========================
-- 4.1

folhas :: Arvore a -> Int
folhas Folha = 1
folhas (Galho _ a1 a2) = folhas a1 + folhas a2

-- ==========================
-- 4.2

altura :: Arvore a -> Int
altura Folha = 0
altura (Galho _ a1 a2) = 1 + maior (altura a1) (altura a2)
  where 
    maior :: Int -> Int -> Int
    maior x y = if x > y then x else y

-- ==========================
-- 4.3

espelho :: Arvore a -> Arvore a
espelho Folha = Folha
espelho (Galho x a1 a2) = (Galho x a2 a1)

-- ==========================
-- 4.4

soma :: Num a => Arvore a -> a
soma Folha = 0
soma (Galho x a1 a2) = x + soma a1 + soma a2

-- ==========================
-- 4.5

dobra :: Num a => Arvore a -> Arvore a
dobra Folha = Folha
dobra (Galho x a1 a2) = (Galho (2*x) (dobra a1) (dobra a2))

-- ==========================
-- 4.6

possui :: Ord a => Arvore a -> a -> Bool
possui Folha x = False
possui (Galho x a1 a2) n = if n == x then True else if (possui a1 n) then True else (possui a2 n)

-- ==========================
-- 4.6

maximo :: (Ord a, Num a) => Arvore a -> a
maximo Folha = 0
maximo (Galho x a1 a2) = (max x (max (maximo a1) (maximo a2)))

-- ==========================
-- 4.7

insere :: Ord a => Arvore a -> a -> Arvore a
insere Folha n = (Galho n Folha Folha)
insere (Galho x a1 a2) n = if n > x then (Galho x a1 (insere a2 n)) else (Galho x (insere a1 n) a2)

-- ==========================
-- 4.8

mapA :: (Num a, Num b) => (a -> b) -> Arvore a -> Arvore b
mapA f Folha = Folha
mapA f (Galho x a1 a2) = (Galho (f x) (mapA f a1) (mapA f a2))

dobraMap :: Num a => a -> a
dobraMap x = x*2

elevaMap :: Num a => a -> a
elevaMap x = x*x

somaMap :: Num a => a -> a
somaMap x = x+1

-- ==========================
-- 4.9

foldA :: Num a => (a -> b -> b) -> b -> Arvore a -> b
foldA f ini Folha = ini
foldA f ini (Galho x a1 a2) = f x (foldA f (foldA f ini a2) a1)


totalSFold :: Int -> Int -> Int
totalSFold x acc = x + acc

totalMFold :: Int -> Int -> Int
totalMFold x acc = x * acc


main = print (foldA totalSFold 0 a2)
