-- Gabriel Alves de Freitas Spinola Sucupira     10418133
-- Enzo Benedetto Proença     10418579

-- 2)
-- Criar as tabelas para inserir os dados
CREATE TABLE cliente 
( 
    cod_cliente INTEGER NOT NULL, 
    nome_cliente VARCHAR (50) NOT NULL, 
    cidade VARCHAR (50) NOT NULL, 
    PRIMARY KEY (cod_cliente) 
);

CREATE TABLE telefones
(
    telefone VARCHAR (20) NOT NULL,
    cod_cliente INTEGER NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
    PRIMARY KEY (telefone)
);
  
CREATE TABLE funcionario 
( 
    cod_funcionario INTEGER NOT NULL,
    nome_funcionario VARCHAR (50) NOT NULL, 
    salario_funcionario FLOAT NOT NULL, 
    cod_auxiliar INTEGER, 
    PRIMARY KEY (cod_funcionario), 
    FOREIGN KEY (cod_auxiliar) REFERENCES funcionario(cod_funcionario) 
);

CREATE TABLE maquina 
( 
    identificacao_maquina INTEGER NOT NULL, 
    nome_maquina VARCHAR (50) NOT NULL, 
    modelo_maquina VARCHAR (50) NOT NULL, 
    cod_funcionario INTEGER NOT NULL, 
    tempo_horas INTEGER NOT NULL, 
    PRIMARY KEY (identificacao_maquina), 
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario) 
);

CREATE TABLE servico 
( 
    cod_servico INTEGER NOT NULL, 
    cod_cliente INTEGER NOT NULL, 
    cep INTEGER NOT NULL, 
    numero_endereco INTEGER NOT NULL, 
    PRIMARY KEY (cod_servico), 
    FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente) 
);

CREATE TABLE servico_usa 
( 
    cod_servico INTEGER NOT NULL, 
    identificacao_maquina INTEGER NOT NULL, 
    cod_cacamba INTEGER UNIQUE, 
    FOREIGN KEY (cod_servico) REFERENCES servico(cod_servico),  
    FOREIGN KEY (identificacao_maquina) REFERENCES maquina(identificacao_maquina) 
);

-- Cadastrar os clientes
INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (1, 'Mateus Fernandes', 'São Paulo');

INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (2, 'Jailson Torriceli', 'Itaquaquecetuba');

INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (3, 'Benício Nazário', 'Carapicuíba');

INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (4, 'Duque-de-Caxias', 'Campinas');

INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (5, 'Cotia Mirim', 'Osasco');

INSERT 
INTO cliente (cod_cliente, nome_cliente, cidade)
VALUES (6, 'Miguel Jefferson', 'Mogi das Cruzes');


-- Cadastrar os telefones dos clientes
INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('292-252-681', 1);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('652-219-209', 1);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('672-229-783', 2);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('664-175-333', 3);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('824-434-422', 4);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('698-329-470', 4);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('404-887-469', 5);

INSERT
INTO telefones (telefone, cod_cliente)
VALUES ('937-477-713', 6);


-- Cadastrar os funcionarios

INSERT
INTO funcionario (cod_funcionario, nome_funcionario, salario_funcionario, cod_auxiliar)
VALUES (3112, 'Sérgio Schmitt', 7500.00, NULL);

INSERT
INTO funcionario (cod_funcionario, nome_funcionario, salario_funcionario, cod_auxiliar)
VALUES (2516, 'Mathias Enelson', 4500.00, NULL);

INSERT
INTO funcionario (cod_funcionario, nome_funcionario, salario_funcionario, cod_auxiliar)
VALUES (8370, 'Felipe Cambuci', 4500.00, NULL);

INSERT
INTO funcionario (cod_funcionario, nome_funcionario, salario_funcionario, cod_auxiliar)
VALUES (5196, 'João Salgueiro', 1920.00, NULL);

INSERT
INTO funcionario (cod_funcionario, nome_funcionario, salario_funcionario, cod_auxiliar)
VALUES (9168, 'Rodrigo Aljins', 16942.00, NULL);

-- Colocar o codigo dos auxiliares agora que todos foram inseridos

UPDATE funcionario 
SET cod_auxiliar = 9168
WHERE (cod_funcionario = 3112);

UPDATE funcionario 
SET cod_auxiliar = 3112
WHERE (cod_funcionario = 2516) OR (cod_funcionario = 5196) OR (cod_funcionario = 8370) OR(cod_funcionario = 2516);


-- Cadastrar as maquinas

INSERT
INTO maquina (identificacao_maquina, nome_maquina, modelo_maquina, cod_funcionario, tempo_horas)
VALUES (5904, 'Retroescavadeira', 'x-100', 3112, 42);

INSERT
INTO maquina (identificacao_maquina, nome_maquina, modelo_maquina, cod_funcionario, tempo_horas)
VALUES (1899, 'Motoniveladora', 'y-245', 8370, 67);

INSERT
INTO maquina (identificacao_maquina, nome_maquina, modelo_maquina, cod_funcionario, tempo_horas)
VALUES ( 8465, 'Pá Carregadeira', 'z-689', 2516, 59);


-- Cadastrar os servicos

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (11, 1, 35394633, 70);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (12, 2, 10261440, 11);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (13, 3, 17909430, 86);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (14, 4, 19854933, 56);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (15, 5, 42512740, 26);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (16, 6, 99275016, 19);

INSERT
INTO servico (cod_servico, cod_cliente, cep, numero_endereco)
VALUES (17, 2, 79324198, 39);


-- Cadastrar o que cada servico usa

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (11, 1899, 478509);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (12, 5904, 153623);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (13, 1899, 963114);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (14, 1899, 267184);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (15, 5904, 410329);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (16, 5904, NULL);

INSERT
INTO servico_usa (cod_servico, identificacao_maquina, cod_cacamba)
VALUES (17, 8465, 910960);


-- 4)

-- Select condicao 1 (com INNER JOIN, mas sem GROUP BY)
SELECT  C.nome_cliente, C.cidade, T.telefone FROM cliente C INNER JOIN telefones T ON (C.cod_cliente = T.cod_cliente);

-- Select condicao 2 (com INNER JOIN e GROUP BY)
SELECT S.cod_servico, C.nome_cliente, S.cep, S.numero_endereco, C.cidade
FROM servico S
INNER JOIN cliente C ON S.cod_cliente = C.cod_cliente
WHERE S.cod_cliente IN ( -- sub consulta para mostrar apenas os clientes que tem somente 1 servico
    SELECT cod_cliente
    FROM servico
    GROUP BY cod_cliente
    HAVING COUNT(cod_cliente) = 1
);

-- Select condicao 3 (consulta com LEFT JOIN)
SELECT M.identificacao_maquina, M.nome_maquina, M.modelo_maquina, F.cod_funcionario, F.nome_funcionario, M.tempo_horas
FROM maquina M
LEFT JOIN funcionario F ON M.cod_funcionario = F.cod_funcionario
ORDER BY M.identificacao_maquina;


-- Select condicao 4 (consulta de 4 tabelas feitas com INNER JOIN)
SELECT S.cod_servico, C.nome_cliente, C.cidade, M.nome_maquina, M.modelo_maquina, F.nome_funcionario
FROM servico S
INNER JOIN cliente C ON S.cod_cliente = C.cod_cliente
INNER JOIN servico_usa SU ON S.cod_servico = SU.cod_servico
INNER JOIN maquina M ON SU.identificacao_maquina = M.identificacao_maquina
INNER JOIN funcionario F ON M.cod_funcionario = F.cod_funcionario
ORDER BY S.cod_servico;
