

--Q1)
	SELECT nomeg, ano
	FROM Musica JOIN Genero
		ON(Musica.codg =  Genero.codg)
	WHERE ano = 2020
--Q2)
	SELECT distinct nomeg
	FROM Musica JOIN Gravaçao JOIN Artista
	Where nomea = 'Emicida
--Q3)
	SELECT distinct nomeM
	FROM Musica JOIN Genero
	WHERE nomeg = 'rapp'
--Q4)
	SELECT disctinct nomem
	FROM Musica JOIN Genero
	WHERE nomem= 'bum bum'
--Q5)	
	SELECT distinct ano
	FROM Musica JOIN Gravação JOIN Artista
	WHERE nomea = 'emicida

--Q6)
	SELECT distinct nomea, musica.codm
	FROM Artista
	LEFT Gravação JOIN Artista.coda = gravação.codea
	LEFT Musica JOIN Gravação.codem = Musica.codm
	ORDER by nomea

--Q7)
	SELECT distinct nomea
	FROM Musica JOIN Gravação JOIN Genero
	WHERE nomeg = 'pop' and sexo = 'f'
--Q8)
	SELECT distinct nomeg
	FROM Musica JOIN Gravação JOIN Artista JOIN Genero
	WHERE nomea = 'mc fioti'
--Q10)
	SELECT distinct
	FROM Artista EXCEPT SELECT distind nomea 
	FROM ARTISTA JOIN Gravação
