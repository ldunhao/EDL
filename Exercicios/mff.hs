import Text.Printf


-- ======================================
-- Exercicio 1
-- ======================================
xs :: [Int]
xs = [1,2,3,4]

duplica :: Int -> Int   -- isso é uma função
duplica n = n * 2

ys :: [Int]             -- isso é um valor
ys = map duplica xs

maior2 :: Int -> Bool   -- isso é uma função
maior2 n = n > 2

n :: Int                -- isso é um valor
n = foldr (+) 0 xs

soma :: [Int] -> Int    -- isso é uma função
soma vs = foldr (+) 0 vs

m :: Int                -- isso é um valor
m = soma xs -- teste da funcao passando a lista xs

-- ==========================
-- 1.1
is_pair :: Int -> Bool  
is_pair n = mod n 2 == 0

pares :: [Int]       
pares = filter is_pair xs


-- ==========================
-- 1.2
soma_1 :: Int -> Int 
soma_1 n = n + 1

incs :: [Int] 
incs = map soma_1 xs


-- ==========================
-- 1.3
dups :: [Int] -> [Int]
dups n = map duplica n

l_dups = dups xs


-- ==========================
-- 1.4
is_maior :: Int -> Int -> Int
is_maior x y = if x>y then x else y

maior :: Int
maior = foldr (is_maior) 0 xs


-- ==========================
-- 1.5
is_menor :: Int -> Int -> Int
is_menor x y = if x<y then x else y

menor :: Int
menor = foldr (is_menor) maior xs

-- ======================================
-- Exercicio 2
-- ======================================

turma1 :: [ (String,Float,Float) ]
turma1 = [ ("Joao",7.5,3.5), ("Maria",10.0,8.0), ("Jose",5.0,3.0), ("Lucas",8.0,8.5), ("Jaime",7.0,5.5), ("Laura",9.0,7.5),("Ricardo",8.0,6.5) ]

nome :: (String,Float,Float) -> String -- Retorna o Nome
nome (nm,_,_) = nm

nota1 :: (String,Float,Float) -> Float -- Retorna a primeira nota
nota1 (_,n1,_) = n1

nota2 :: (String,Float,Float) -> Float -- Retorna a segunda Nota
nota2 (_,_,n2) = n2

media :: (String,Float,Float) -> Float -- Retorna a media
media aluno = ((nota1 aluno) + (nota2 aluno)) / 2

medias :: [ (String,Float,Float) ] -> [Float] -- Retorna a lista das medias
medias turma = map media turma

-- ==========================
-- 2.1

notas1 :: [Float]
notas1 = map nota1 turma1

-- ==========================
-- 2.2
maior_8 :: (String,Float,Float) -> Bool
maior_8 (_,n1,n2) = n1 >= 8 && n2 >=8 

nome_8 :: [(String,Float,Float)] -> [(String,Float,Float)]
nome_8 turma = filter maior_8 turma

oitos :: [(String,Float,Float)] -> [String]
oitos turma = map nome (nome_8 turma)

-- ==========================
-- 2.3
notas2 :: [Float]
notas2 = map nota2 turma1

soma_n1 :: [(String,Float,Float)] -> Float
soma_n1 turma = foldr (+) 0 notas1

soma_n2 :: [(String,Float,Float)] -> Float
soma_n2 turma = foldr (+) 0 notas2

converte :: Int -> Float
converte x = a where a = fromIntegral x :: Float

tamanho :: Float
tamanho = converte (length turma1)

todas :: [(String,Float,Float)] -> (Float,Float,Float)
todas turma = (soma_n1 turma / tamanho ,soma_n2 turma/ tamanho,((soma_n1 turma + soma_n2 turma) / tamanho))

-- p1ep2 :: String
-- p1ep2 = printf "%.2f" (((soma_n1 turma1 + soma_n2 turma1) / tamanho) :: Float)

-- p1 :: String
-- p1 = printf "%.2f" (soma_n1 turma1 / tamanho :: Float)

-- p2 :: String
-- p2 = printf "%.2f" (soma_n2 turma1 / tamanho :: Float)

-- ==========================
-- 2.4
menor_5 :: Float -> Bool
menor_5 x = x <= 5 

menores_5 :: [ (String, Float, Float) ] -> [Float]
menores_5 turma = filter menor_5 (notas1 ++ notas2) 

baixas :: [Float]
baixas = menores_5 turma1

-- ==========================
-- 2.5

-- resultado :: (String,Float,Float) -> String
-- resultado aluno = if media aluno >= 5 then "aprovado" else "reprovado"

-- format :: (String,Float,Float) -> String
-- format aluno = nome aluno ++ " " ++ (show(media aluno)) ++ " " ++ "(" ++ resultado aluno ++ ")" "\n"

-- pretty :: [(String,Float,Float)] -> [String]
-- pretty turma = map format turma


-- ======================================
-- Exercicio 3
-- ======================================

bandas ::   [[String]]
bandas = [ ["Gilberto Gil"],["Vitor" , "Leo"],["Gonzagao"],["Claudinho" , "Bochecha"] ] 

musicas :: [ (String,Int,Int) ]
musicas = [ ("Aquele Abraco",1,100),("Esperando na Janela",1,150), ("Borboletas",2,120), ("Asa Branca",3,120), ("Assum Preto",3,140), ("Vem Morena",3,200),("Nosso Sonho",4,150),("Quero te Encontrar",4,100) ]

-- ==========================
-- 3.1

nome_mus ::  (String,Int,Int) -> String
nome_mus (x,y,z) = x
nome_musicas = map nome_mus musicas

-- ==========================
-- 3.2

duracao :: (String,Int,Int) -> Bool
duracao (x,y,z) = z >= 120
duracao_mus = filter duracao musicas

-- ==========================
-- 3.3

dur_mus :: (String,Int,Int) -> Int
dur_mus (_,_,z) = z

dur_list = map dur_mus musicas

maior_mus :: Int
maior_mus = foldr (is_maior) 0 dur_list


-- ==========================
-- 3.4

tmp :: [String]
tmp = map nome_mus duracao_mus


-- ======================================
-- PRINT
-- ======================================

main = print (tmp)