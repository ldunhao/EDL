-- ======================================
-- Exercicio 3
-- ======================================

import Debug.Trace

type Mem = [(String,Int)]
type Cod = [(String,Cmd)]
type Env = (Mem,Cod)

data Cmd = Atr String Exp
         | Prt Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Fun String String Cmd
  deriving Show


data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
         | App String Exp
  deriving Show

consulta :: [(String,a)] -> String -> a
consulta []           id = undefined
consulta ((id',v'):l) id = if id == id' then
                            v'
                           else
                            consulta l id

escreve :: [(String,a)] -> String -> a -> [(String,a)]
escreve l id v = (id,v):l

avaliaExp :: Env -> Exp -> Int
avaliaExp _         (Num v)     = v
avaliaExp env       (Add e1 e2) = (avaliaExp env e1) + (avaliaExp env e2)
avaliaExp env       (Sub e1 e2) = (avaliaExp env e1) - (avaliaExp env e2)
avaliaExp (mem,_)   (Var id)    = consulta mem id
avaliaExp (mem,cod) (App id e)  = ret where
                                    ret = consulta mem'' "ret"
                                    (mem'',_) = avaliaCmd (mem',cod) fun
                                    mem' = escreve mem "arg" arg
                                    arg  = avaliaExp (mem,cod) e
                                    fun  = consulta cod id

avaliaCmd :: Env -> Cmd -> Env
avaliaCmd env       (Prt e)         = traceShow (avaliaExp env e) env
avaliaCmd (mem,cod) (Atr id exp)    = (escreve mem id v,cod) where
                                        v = avaliaExp (mem,cod) exp
avaliaCmd env       (Seq c1 c2)     = avaliaCmd env' c2 where
                                        env' = avaliaCmd env c1
avaliaCmd env       (Cnd exp c1 c2) = if (avaliaExp env exp) /= 0 then
                                        avaliaCmd env c1
                                      else
                                        avaliaCmd env c2
avaliaCmd (mem,cod) (Fun id id' c)  = (mem, escreve cod id cmd') where
                                          cmd' = Seq (Atr id'(Var "arg")) (c)                                                  


p1 = Seq (Seq (Atr "x" (Num 1)) (Atr "y" (Num 2))) (Prt (Add (Var "x") (Var "y")))

p2 = Seq
      (Fun "duplica" "x"
        (Atr "ret"
          (Add (Var "x")
               (Var "x"))))
      (Prt (App "duplica" (Num 10)))

p3 = Seq
      (Fun "soma" "x"
        (Cnd (Var "x")
          (Atr "ret"
            (Add (Var "x")
                 (App "soma"
                   (Sub (Var "x")
                        (Num 1)))))
          (Atr "ret" (Num 0))))
      (Prt (App "soma" (Num 10)))

p4= Seq (Atr "y" (Num 10)) (Seq (Fun "f" "x" (Seq (Atr "y" (Var "x")) 
    (Seq (Prt (Var "y")) (Atr "ret" (Var "y") )) ))
    (Seq (Prt (App "f" (Num 20))) (Prt (Var "y"))))

main = print (avaliaCmd ([],[]) p4)