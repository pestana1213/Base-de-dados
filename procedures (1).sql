use minimercado;
-- Procurar Clientes
select *from Cliente;

-- Procurar Funcionários
select *from funcionario;

-- Procurar Contactos de Cliente
DELIMITER //
CREATE PROCEDURE lista_nrtelmovel_cliente (IN id_cliente INT)
BEGIN
	SELECT cliente.id, cliente.Nome, nr_telemovel.Numero
    FROM nr_telemovel, listacontactos, cliente
	WHERE cliente.id = id_cliente 
    AND cliente.ListaContactos_id = listacontactos.id
    AND listacontactos.id = nr_telemovel.ListaContactos_id;
END; // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lista_email_cliente (IN id_client INT)
BEGIN
	SELECT cliente.id, cliente.Nome, emails.Email
    FROM emails, listacontactos, cliente
	WHERE cliente.id = id_client 
    AND cliente.ListaContactos_id = listacontactos.id
    AND listacontactos.id = emails.ListaContactos_id;
END; // 
DELIMITER ;

-- Procurar Contactos de Funcionário
DELIMITER //
CREATE PROCEDURE lista_nrtelmovel_func (IN id_funcionario INT)
BEGIN
	SELECT funcionario.id, funcionario.nome,nr_telemovel.Numero
    FROM nr_telemovel, listacontactos, funcionario
	WHERE funcionario.id = id_funcionario
    AND funcionario.ListaContactos_id = listacontactos.id
    AND listacontactos.id = nr_telemovel.ListaContactos_id;
END; // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lista_email_func (IN id_func INT)
BEGIN
	SELECT funcionario.id, funcionario.Nome, emails.Email
    FROM emails, listacontactos, funcionario
	WHERE funcionario.id = id_func 
    AND funcionario.ListaContactos_id = listacontactos.id
    AND listacontactos.id = emails.ListaContactos_id;
END; // 
DELIMITER ;


-- Procurar Contactos Minimercado
DELIMITER //
CREATE PROCEDURE lista_nrtelmovel_merc (IN id_merc INT)
BEGIN
	SELECT minimercado.id, minimercado.nome,nr_telemovel.Numero
    FROM nr_telemovel, listacontactos, minimercado
	WHERE minimercado.id = id_merc
    AND minimercado.ListaContactos_id = listacontactos.id
    AND listacontactos.id = nr_telemovel.ListaContactos_id;
END; // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE lista_email_merc (IN id_merc INT)
BEGIN
	SELECT minimercado.id, minimercado.Nome, emails.Email
    FROM emails, listacontactos, minimercado
	WHERE minimercado.id = id_merc 
    AND minimercado.ListaContactos_id = listacontactos.id
    AND listacontactos.id = emails.ListaContactos_id;
END; // 
DELIMITER ;

-- Procurar Residência de um Cliente
DELIMITER //
CREATE PROCEDURE residencia_cliente (IN id_cliente INT)
BEGIN
	SELECT cliente.id, cliente.Nome, rua.designacao, cidade.designacao, codpostal.Codigo, codpostal.Designacao, pais.designacao
    FROM cliente, localizacao, rua, cidade, codpostal, pais
	WHERE cliente.id=id_cliente
    AND cliente.localizacao_id = localizacao.id
    AND localizacao.rua_id = rua.id
    AND localizacao.cidade_id1 = cidade.id
    AND localizacao.CodPostal_id = codpostal.id
    AND localizacao.Pais_is = pais.id;
END; // 
DELIMITER ;

-- Procurar Residência de Funcionário
DELIMITER //
CREATE PROCEDURE residencia_func (IN id_func INT)
BEGIN
	SELECT funcionario.id, funcionario.Nome, rua.designacao, cidade.designacao, codpostal.Codigo, codpostal.Designacao, pais.designacao
    FROM funcionario, localizacao, rua, cidade, codpostal, pais
	WHERE funcionario.id=id_func
    AND funcionario.localizacao_id = localizacao.id
    AND localizacao.rua_id = rua.id
    AND localizacao.cidade_id1 = cidade.id
    AND localizacao.CodPostal_id = codpostal.id
    AND localizacao.Pais_is = pais.id;
END; // 
DELIMITER ;

-- Procurar Localização de Minimercado
DELIMITER //
CREATE PROCEDURE residencia_merc (IN id_merc INT)
BEGIN
	SELECT minimercado.id, minimercado.Nome, rua.designacao, cidade.designacao, codpostal.Codigo, codpostal.Designacao, pais.designacao
    FROM minimercado, localizacao, rua, cidade, codpostal, pais
	WHERE minimercado.id=id_merc
    AND minimercado.localizacao_id = localizacao.id
    AND localizacao.rua_id = rua.id
    AND localizacao.cidade_id1 = cidade.id
    AND localizacao.CodPostal_id = codpostal.id
    AND localizacao.Pais_is = pais.id;
END; // 
DELIMITER ;

-- Procurar Faturas
select *from fatura;

-- Procurar Preços de Produtos
DELIMITER //
CREATE PROCEDURE preco_prod (IN id_prod INT)
BEGIN
	SELECT produto.preco
    FROM produto
	WHERE produto.id=id_prod;
END; // 
DELIMITER ;

-- Total gasto por Cliente
DELIMITER //
create procedure gasto_por_cliente (in id_total INT)
begin
    select cliente.id, cliente.nome, sum(fatura.valor)
    from fatura,cliente
    where id_total = cliente.id
    and fatura.cliente_id = cliente.id;
end; //
DELIMITER ;

-- Procurar Compras feitas por Clientes
DELIMITER //
create procedure compras_por_cliente (IN id_cliente INT) 
begin 
	select cliente.nome, fatura.nr, produto.descricao, fatura_produto.quantidade
    from fatura, cliente, produto, fatura_produto 
    where id_cliente = cliente.id
    and cliente.id = fatura.Cliente_id
    and fatura.nr = fatura_produto.fatura_nr
    and fatura_produto.produto_id = produto.id; 
end; //   
DELIMITER ;

-- Procurar faturas emitidas por funcionario
DELIMITER //
create procedure fatura_por_func (in id_func INT)
begin
    select fatura.Funcionario_id, fatura.nr, funcionario.nome
    from fatura,funcionario
    where id_func = funcionario.id
    and fatura.funcionario_id = funcionario.id;
end; //
DELIMITER ;