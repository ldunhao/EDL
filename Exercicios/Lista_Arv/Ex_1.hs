-- ======================================
-- Exercicio 1
-- ======================================

data Arvore = Folha | Galho Arvore Arvore 
  deriving Show

a1 = Galho ( Galho Folha Folha) (Galho Folha Folha)
a2 = Galho ( Galho ( Galho Folha Folha) Folha) Folha
a3 = Galho Folha ( Galho (Galho Folha Folha) (Galho Folha Folha))
a4 = Folha

-- ==========================
-- 1.1

folhas:: Arvore -> Int
folhas Folha = 1
folhas (Galho a1 a2) = folhas a1 + folhas a2

-- ==========================
-- 1.2

altura:: Arvore -> Int
altura Folha = 0
altura (Galho a1 a2) = 1 + maior (altura a1) (altura a2)
  where 
    maior :: Int -> Int -> Int
    maior x y= if x> y then x else y

-- ==========================
-- 1.3

espelho:: Arvore -> Arvore
espelho Folha = Folha
espelho (Galho a1 a2)= (Galho (espelho a2) (espelho a1))

main = print (altura a3)