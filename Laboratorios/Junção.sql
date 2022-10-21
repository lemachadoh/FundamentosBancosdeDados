--Consulta 1 
p U.nome (U)

--consulta 2 
p U.nome
s U.idade = 20 (U)

--consulta 3  
p V.codu , V.nro
s V.cods = 's1' (V)

--consulta 4 
p V.codu, V.nro
s S.nome = 'friends'(V?S)
junta 6 x 4


p V.codu, V.nro
(V ?(s S.nome = 'friends' (S)))
junta 6x1

--JUNÇÃO NATURAL	

--consulta 5  
p U.nome, S.nome, V.nro
(V ? U ? (S.cods = V.cods) S)

--consulta 6 
p U.nome, S.nome, U.idade
(V ? U ? (S.nome = 'friends') S)
junta 6x4

--JUNÇÃO  NATURAL
