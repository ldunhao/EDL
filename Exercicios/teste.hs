-- ===========================
-- TESTE 02/09/2019
-- ===========================

-- ===========================
-- Exercicio 1
brasil19 = [("Corinthians",(8,7,2),(19,9)), ("Goias",(6,3,8),(16,27)),("Flamengo",(11,3,3),(38,18)),("Gremio",(5,7,5),(20,21))]

get_nomes :: (String,(Int,Int,Int),(Int,Int)) -> String
get_nomes (nome,ved,gols) = nome

nomes = map get_nomes brasil19


-- ===========================
-- Exercicio 2

calc_pontos :: (Int,Int,Int) -> Int
calc_pontos (x,y,z) = x*3 + y*1 + z*0

nom_pont :: (String,(Int,Int,Int),(Int,Int)) -> (String,Int)
nom_pont (nome,ved,gols) = (nome,calc_pontos(ved))

pontos = map nom_pont brasil19

-- ===========================
-- Exercicio 3

saldo_pos :: (String,(Int,Int,Int),(Int,Int))  -> Bool
saldo_pos (x,y,(a,b)) = (a-b) > 0

positivos :: [(String,(Int,Int,Int),(Int,Int))] -> [(String,(Int,Int,Int),(Int,Int))]
positivos tabela = filter saldo_pos tabela

-- ===========================
-- Exercicio 4

time_pont :: (String,(Int,Int,Int),(Int,Int)) -> (String,Int,(Int,Int))
time_pont (nome,ved,gols) = (nome,calc_pontos(ved),gols)

maior :: (String,(Int,Int,Int),(Int,Int)) -> Int -> Bool
maior (_,ved,gols) x = calc_pontos(ved) > x

tab_pontos :: [(String,(Int,Int,Int),(Int,Int))] -> [(String,Int,(Int,Int))]
tab_pontos tabela = map time_pont tabela

-- ===========================
-- Exercicio 5

get_pontos :: (String,(Int,Int,Int),(Int,Int)) -> Int
get_pontos (_,ved,_) = calc_pontos(ved)

array_pontos :: [(String,(Int,Int,Int),(Int,Int))] -> [Int]
array_pontos tabela = map get_pontos tabela

array :: [Int]
array = array_pontos brasil19

is_maior :: Int -> Int -> Int
is_maior x y = if x>y then x else y

maior_pontos :: Int
maior_pontos = foldr (is_maior) 0 array

eh_maior :: (String,(Int,Int,Int),(Int,Int)) -> Bool
eh_maior (_,ved,_) = calc_pontos(ved) >= maior_pontos

campeao :: [(String,(Int,Int,Int),(Int,Int))] -> [(String,(Int,Int,Int),(Int,Int))]
campeao tabela = filter eh_maior tabela

-- ===========================
-- Exercicio 6

calc_jogos :: (String,(Int,Int,Int),(Int,Int)) -> Int
calc_jogos (_,(x,y,z),_) = x+y+z

converte :: Int -> Float
converte x = a where a = fromIntegral x :: Float

get_gols :: (String,(Int,Int,Int),(Int,Int)) -> Int
get_gols (_,_,(x,_)) = x

tabela_gols :: [Int] -> Int
tabela_gols tabela = foldr (+) 0 tabela

jogos :: [(String,(Int,Int,Int),(Int,Int))] -> Int
jogos tabela = calc_jogos (head tabela)

gols :: [(String,(Int,Int,Int),(Int,Int))] -> [Int]
gols tabela = map get_gols tabela

mediaGols :: [(String,(Int,Int,Int),(Int,Int))] -> Float
mediaGols tabela = converte(tabela_gols(gols(tabela)))/converte(jogos tabela)


-- ===========================
-- PRINT
main = print (campeao brasil19)