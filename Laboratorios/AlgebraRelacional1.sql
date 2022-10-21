-- Todos os dados dos clientes que preferem pizza vegetariana
	s CLIENTES.preferencias = 'vegetariana'(CLIENTES)

-- Todos os dados dos clientes que moram no bairro agronomia 
	s CLIENTES.bairro = 'agronomia'(CLIENTES)

-- Todos os dados dos clientes maiores de 18 anos 
	s CLIENTES.idade > 18(CLIENTES)

-- Todos os dados dos clientes maiores de 18 e que gostam de pizza apimentada 
	s CLIENTES.idade > 18 ? CLIENTES.preferencias = 'apimentada'(CLIENTES)

-- Listar os nomes dos sabores de pizza
	p SABORES.nome (SABORES)

-- Listar os nomes dos clientes e o bairro onde moram
	p CLIENTES.nome , CLIENTES.bairro(CLIENTES)

-- Listar os nomes dos clientes que moram no bairro cidade baixa
	p CLIENTES.nome 
	(s CLIENTES.bairro = 'cidade baixa'(CLIENTES))

-- Listar os nomes dos clientes que moram no bairro cidade baixa e que gostam de pizza apimentada 
	p CLIENTES.nome
	s CLIENTES.bairro = 'cidade baixa'? CLIENTES.preferencias = 'apimentada'(CLIENTES)

-- Nomes dos clientes que fizeram pedido
	p CLIENTES.nome
	(s CLIENTES.codc = PEDIDOS.codc
	(CLIENTES ? PEDIDOS))


-- Nomes dos clientes que fizeram pedido tamanho grande 
	p CLIENTES.nome
	(s CLIENTES.codc = PEDIDOS.codc ? PEDIDOS.tamanho = 'grande'
	(CLIENTES ? PEDIDOS))
	
	
-- Nome dos clientes e o sabor da pizza que pediram
	p CLIENTES.nome , SABORES.nome
	(s CLIENTES.codc = PEDIDOS.codc ? SABORES.cods = PEDIDOS.cods 
	(CLIENTES ? PEDIDOS ? SABORES))

-- Nome dos clientes que pediram pizza sabor el fuego tamanho grande  
	p CLIENTES.nome , SABORES.nome
	(s CLIENTES.codc = PEDIDOS.codc ? SABORES.cods = PEDIDOS.cods ? SABORES.nome = 'el fuego'
	(CLIENTES ? PEDIDOS ? SABORES))
