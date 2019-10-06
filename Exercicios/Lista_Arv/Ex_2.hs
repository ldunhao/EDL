
-- ======================================
-- Exercicio 2
-- ======================================
data Arvore  = Folha | Galho Int (Arvore) (Arvore)   
    deriving Show
  
a0 = Galho 10 Folha Folha
a1 = Galho 10 a0 a0
a2 = Galho 1 ( Galho 0 ( a0) Folha) Folha
a3 = Galho 2 Folha ( Galho 3 (a0) (a0))
a4 = Galho 3 (Galho 2 Folha Folha) (Galho 4 Folha (Galho 6 Folha Folha))


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
maximo (Galho x a1 a2) = max x (maximo a2)
    
  
-- ==========================
-- 2.4.3
  
insere :: Arvore -> Int -> Arvore
insere Folha n = (Galho n Folha Folha)
insere (Galho x a1 a2) n = if n > x then (Galho x a1 (insere a2 n)) else (Galho x (insere a1 n) a2)

        
main = print (maximo a4)