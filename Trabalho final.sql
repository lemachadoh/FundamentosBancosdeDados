DROP TABLE IF EXISTS compoe cascade;
DROP TABLE IF EXISTS produz cascade;
DROP TABLE IF EXISTS escreve cascade;
DROP TABLE IF EXISTS dirige cascade;
DROP TABLE IF EXISTS atua cascade;
DROP TABLE IF EXISTS pessoa cascade;
DROP TABLE IF EXISTS episodio cascade;
DROP TABLE IF EXISTS serie_tv cascade;
DROP TABLE IF EXISTS filme cascade;
DROP TABLE IF EXISTS feita cascade;
DROP TABLE IF EXISTS classificado cascade;
DROP TABLE IF EXISTS obra cascade;
DROP TABLE IF EXISTS estudio cascade;
DROP TABLE IF EXISTS genero cascade;

CREATE TABLE pessoa (
    id_pessoa smallint PRIMARY KEY,
    nome varchar(60) NOT NULL,
    nacionalidade varchar(30) NOT NULL,
    data_nascimento date NOT NULL,
    pessoa_tipo bit(5) NOT NULL
);

CREATE TABLE obra (
    id_obra smallint PRIMARY KEY,
    classificacao_indicativa varchar(60) NOT NULL,
    data_estreia date NOT NULL,
    titulo varchar(60) NOT NULL,
    orcamento bigint,
    receita bigint
);

CREATE TABLE estudio (
    id_estudio smallint PRIMARY KEY,
    nome varchar(60) NOT NULL,
    site varchar(60)
);

CREATE TABLE genero (
    nome_genero varchar(20) PRIMARY KEY
);

CREATE TABLE episodio (
    duracao interval NOT NULL,
    nro_episodio smallint NOT NULL,
    temporada smallint NOT NULL,
    fk_obra_id_obra smallint PRIMARY KEY,
    fk_serie_tv_fk_obra_id_obra smallint
);

CREATE TABLE serie_tv (
    emissora varchar(60) NOT NULL,
    fk_obra_id_obra smallint PRIMARY KEY
);

CREATE TABLE filme (
    duracao interval NOT NULL,
    fk_obra_id_obra smallint PRIMARY KEY
);

CREATE TABLE compoe (
    fk_pessoa_id_pessoa smallint,
    fk_obra_id_obra smallint,
    album varchar(60),
	PRIMARY KEY (fk_pessoa_id_pessoa,fk_obra_id_obra)
);

CREATE TABLE produz (
    fk_pessoa_id_pessoa smallint,
    fk_obra_id_obra smallint,
	PRIMARY KEY (fk_pessoa_id_pessoa,fk_obra_id_obra)
);

CREATE TABLE escreve (
    fk_pessoa_id_pessoa smallint,
    fk_obra_id_obra smallint,
	PRIMARY KEY (fk_pessoa_id_pessoa,fk_obra_id_obra)
);

CREATE TABLE dirige (
    fk_pessoa_id_pessoa smallint,
    fk_obra_id_obra smallint,
	PRIMARY KEY (fk_pessoa_id_pessoa,fk_obra_id_obra)
);

CREATE TABLE atua (
    fk_pessoa_id_pessoa smallint,
    fk_obra_id_obra smallint,
    papel varchar(60) NOT NULL,
	PRIMARY KEY (fk_pessoa_id_pessoa,fk_obra_id_obra,papel)
);

CREATE TABLE feita (
    fk_estudio_id_estudio smallint,
    fk_obra_id_obra smallint,
	PRIMARY KEY (fk_estudio_id_estudio,fk_obra_id_obra)
);

CREATE TABLE classificado (
    fk_genero_nome_genero varchar(20),
    fk_obra_id_obra smallint,
	PRIMARY KEY (fk_genero_nome_genero,fk_obra_id_obra)
);
 
ALTER TABLE episodio ADD CONSTRAINT FK_episodio_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE CASCADE;
 
ALTER TABLE episodio ADD CONSTRAINT FK_episodio_3
    FOREIGN KEY (fk_serie_tv_fk_obra_id_obra)
    REFERENCES serie_tv (fk_obra_id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE serie_tv ADD CONSTRAINT FK_serie_tv_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE CASCADE;
 
ALTER TABLE filme ADD CONSTRAINT FK_filme_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE CASCADE;
 
ALTER TABLE compoe ADD CONSTRAINT FK_compoe_1
    FOREIGN KEY (fk_pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE compoe ADD CONSTRAINT FK_compoe_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_1
    FOREIGN KEY (fk_pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE escreve ADD CONSTRAINT FK_escreve_1
    FOREIGN KEY (fk_pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE escreve ADD CONSTRAINT FK_escreve_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE dirige ADD CONSTRAINT FK_dirige_1
    FOREIGN KEY (fk_pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE dirige ADD CONSTRAINT FK_dirige_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE atua ADD CONSTRAINT FK_atua_1
    FOREIGN KEY (fk_pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE atua ADD CONSTRAINT FK_atua_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE RESTRICT;
 
ALTER TABLE feita ADD CONSTRAINT FK_feita_1
    FOREIGN KEY (fk_estudio_id_estudio)
    REFERENCES estudio (id_estudio)
    ON DELETE RESTRICT;
 
ALTER TABLE feita ADD CONSTRAINT FK_feita_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE SET NULL;
 
ALTER TABLE classificado ADD CONSTRAINT FK_classificado_1
    FOREIGN KEY (fk_genero_nome_genero)
    REFERENCES genero (nome_genero)
    ON DELETE RESTRICT;
 
ALTER TABLE classificado ADD CONSTRAINT FK_classificado_2
    FOREIGN KEY (fk_obra_id_obra)
    REFERENCES obra (id_obra)
    ON DELETE SET NULL;

---------------------------------------------------------------------------------------------------------------------------
SET datestyle = dmy;

--PESSOA:
INSERT into pessoa
VALUES(1,'Tom Hanks','Estados Unidos',to_date('09/07/1956', 'DD-MM-YYYY'), cast(13 as bit(5)));

INSERT into pessoa
VALUES(2,'Larissa Manoela','Brasil',to_date('28/12/2000', 'DD-MM-YYYY'), cast(17 as bit(5)));

INSERT into pessoa
VALUES(3,'Elodie Yung','França',to_date('22/02/1981', 'DD-MM-YYYY'), cast(15 as bit(5)));

INSERT into pessoa
VALUES(4,'Charlize Theron','Africa do Sul',to_date('07/08/1975', 'DD-MM-YYYY'), cast(9 as bit(5)));

INSERT into pessoa
VALUES(5,'Kim Mi-soo','Coreia do Sul',to_date('16/03/1992', 'DD-MM-YYYY'), cast(1 as bit(5)));

INSERT into pessoa
VALUES(6,'Frank Darabont','França',to_date('28/01/1959', 'DD-MM-YYYY'), cast(14 as bit(5)));

INSERT into pessoa
VALUES(7,'Francis Ford Coppola','Estados Unidos',to_date('07/04/1939', 'DD-MM-YYYY'), cast(14 as bit(5)));

INSERT into pessoa
VALUES(8, 'Christopher Nolan','Inglaterra', to_date('30/07/1970','DD-MM-YYYY'), cast(14 as bit(5)));

INSERT into pessoa
VALUES(9,'John Williams', 'Estados Unidos', to_date('08/08/1932','DD-MM-YYYY'), cast(16 AS BIT(5)));

INSERT into pessoa
VALUES(10,'Ennio Morricone', 'Itália', to_date('10/11/1928','DD-MM-YYYY'), cast(16 AS BIT(5)));
       
INSERT into pessoa
VALUES(11, 'Hans Zimmer', 'Alemanha', to_date('12/09/1957', 'DD-MM-YYYY'), cast(16 AS BIT(5)));

INSERT into pessoa
VALUES(12, 'Hildur Guðnadóttir', 'Islândia', to_date('04/09/1982', 'DD-MM-YYYY'), CAST(16 AS BIT(5)));

INSERT into pessoa
VALUES(13, 'Jane Featherstone', 'Inglaterra', to_date('24/03/1969', 'DD-MM-YYYY'), CAST(8 AS BIT(5)));

INSERT into pessoa
VALUES(14, 'Craig Mazin', 'Estados Unidos', to_date('08/05/1971', 'DD-MM-YYYY'), CAST(13 AS BIT(5)));

INSERT into pessoa
VALUES(15, 'Johan Renck', 'Suécia', to_date('05/12/1966', 'DD-MM-YYYY'), CAST(11 AS BIT(5)));

INSERT into pessoa
VALUES(16, 'Jessie Buckley', 'Irlanda', to_date('28/12/1989', 'DD-MM-YYYY'), CAST(17 AS BIT(5)));

INSERT into pessoa
VALUES(17, 'Nino Rota', 'Itália', to_date('10/04/1979', 'DD-MM-YYYY'), CAST(16 AS BIT(5)));

INSERT into pessoa
VALUES(18, 'Vince Gilligan', 'Estados Unidos', to_date('10/02/1967', 'DD-MM-YYYY'), CAST(14 AS BIT(5)));

INSERT into pessoa
VALUES(19, 'Mario Puzo', 'Estados Unidos', to_date('15/10/1920', 'DD-MM-YYYY'), CAST(4 AS BIT(5)));

INSERT into pessoa
VALUES(20, 'Steven Spielberg', 'Estados Unidos', to_date('18/12/1946', 'DD-MM-YYYY'), CAST(14 AS BIT(5)));

INSERT into pessoa
VALUES(21, 'Steven Spielberg', 'Estados Unidos', to_date('18/12/1946', 'DD-MM-YYYY'), CAST(14 AS BIT(5)));

INSERT into pessoa
VALUES(22, 'Marlon Brando', 'Estados Unidos', to_date('03/04/1924', 'DD-MM-YYYY'), CAST(3 AS BIT(5)));

INSERT into pessoa
VALUES(23, 'Christian Bale', 'Inglaterra', to_date('30/01/1974', 'DD-MM-YYYY'), CAST(9 AS BIT(5)));

INSERT into pessoa
VALUES(24, 'Heath Ledger', 'Estados Unidos', to_date('22/01/1979', 'DD-MM-YYYY'), CAST(3 AS BIT(5)));

INSERT into pessoa
VALUES(25, 'Al Pacino', 'Estados Unidos', to_date('25/04/1940', 'DD-MM-YYYY'), CAST(11 AS BIT(5)));

INSERT into pessoa
VALUES(26, 'Robert De Niro', 'Estados Unidos', to_date('17/08/1943', 'DD-MM-YYYY'), CAST(13 AS BIT(5)));

INSERT into pessoa
VALUES(27, 'Bryan Cranston', 'Estados Unidos', to_date('07/03/1956', 'DD-MM-YYYY'), CAST(13 AS BIT(5)));

INSERT into pessoa
VALUES(28, 'David Attenborough', 'Inglaterra', to_date('08/05/1926', 'DD-MM-YYYY'), CAST(15 AS BIT(5)));

INSERT into pessoa
VALUES(29, 'Aaron Paul', 'Estados Unidos', to_date('27/08/1979', 'DD-MM-YYYY'), CAST(9 AS BIT(5)));

INSERT into pessoa
VALUES(90, 'Compositor Genérico', 'Mercúrio', to_date('01/01/1900', 'DD-MM-YYYY'), CAST(16 AS BIT(5)));

INSERT into pessoa
VALUES(91, 'Produtor Genérico', 'Vênus', to_date('01/01/2000', 'DD-MM-YYYY'), CAST(8 AS BIT(5)));

INSERT into pessoa
VALUES(92, 'Roteirista Genérico', 'Marte', to_date('01/01/2100', 'DD-MM-YYYY'), CAST(4 AS BIT(5)));

INSERT into pessoa
VALUES(93, 'Diretor Genérico', 'Júpiter', to_date('01/12/1900', 'DD-MM-YYYY'), CAST(2 AS BIT(5)));

INSERT into pessoa
VALUES(94, 'Ator Genérico', 'Saturno', to_date('25/12/2022', 'DD-MM-YYYY'), CAST(1 AS BIT(5)));

--OBRA:

--obra-filmes:

INSERT into obra
VALUES(1,'não recomendado para menores de 14 anos',to_date('24/10/1972','DD-MM-YYY'),'O Poderoso Chefão',6000000,250341816);

INSERT into obra
VALUES(2,'não recomendado para menores de 12 anos',to_date('24/07/2008','DD-MM-YYY'),'O Cavaleiro das Trevas',185000000,1006234167);

INSERT into obra
VALUES(3,'não recomendado para menores de 14 anos',to_date('14/10/1977','DD-MM-YYY'),'O Poderoso Chefão pt II',13000000,47961919);

INSERT into obra
VALUES(4,'não recomendado para menores de 12 anos',to_date('04/03/1994','DD-MM-YYY'),'A Lista de Schindler',22000000,322161245);

INSERT into obra
VALUES(5,'não recomendado para menores de 14 anos',to_date('17/12/2003','DD-MM-YYY'),'O senhor dos Anéis - O regresso do Rei',94000000,1146436214);

INSERT into obra
VALUES(36,'Livre',to_date('01/01/2001','DD-MM-YYY'),'Filme Genérico',4000000,146436214);

--obra-series:

INSERT into obra
VALUES(6,'livre',to_date('06/11/2016','DD-MM-YYY'),'Planeta Terra II',NULL,NULL);

INSERT into obra
VALUES(7,'não recomendado para menores de 16 anos',to_date('20/01/2008','DD-MM-YYY'),'Breaking Bad',NULL,NULL);

INSERT into obra
VALUES(8,'Não recomendada para menores de 18 anos',to_date('09/09/2001','DD-MM-YYY'),'Band of Brothers',NULL,NULL);

INSERT into obra
VALUES(9,'livre',to_date('27/02/2006','DD-MM-YYY'),'Planeta Terra',NULL,NULL);

INSERT into obra
VALUES(10,'Não recomendada para menores de 16 anos',to_date('06/05/2019','DD-MM-YYY'),'Chernobyl',NULL,NULL);

--obra-episodios:

--referente a planet earth 2 obra id 6:
insert into obra
values(11,'Livre',to_date('06/11/2016','DD-MM-YYYY'), 'Islands', NULL, NULL);

INSERT into obra
VALUES(12, 'Livre', to_date('13/11/2016','DD-MM-YYYY'), 'Mountains', NULL, NULL);

INSERT into obra
VALUES(13, 'Livre', to_date('20/11/2016','DD-MM-YYYY'), 'Jungles', NULL, NULL);

INSERT into obra
VALUES(14, 'Livre', to_date('27/11/2016','DD-MM-YYYY'), 'Deserts', NULL, NULL);

INSERT into obra
VALUES(15, 'Livre', to_date('04/12/2016','DD-MM-YYYY'), 'Grasslands', NULL, NULL);

--referente a planet earth 1 obra id 9:
INSERT into obra
VALUES(16, 'Livre', to_date('05/04/2006','DD-MM-YYYY'), 'From Pole to Pole', NULL, NULL);

INSERT into obra
VALUES(17, 'Livre', to_date('12/03/2006','DD-MM-YYYY'), 'Mountains', NULL, NULL);

INSERT into obra
VALUES(18 ,'Livre', to_date('19/03/2006','DD-MM-YYYY'), 'Fresh Water', NULL, NULL);

INSERT into obra
VALUES(19 ,'Livre', to_date('26/03/2006','DD-MM-YYYY'), 'Caves', NULL, NULL);

--referente a breaking bad season 1 obra id 7:
INSERT into obra
VALUES(20, 'Não recomendado para menores de 16 anos', to_date('20/01/2008','DD-MM-YYYY'), 'Pilot', NULL, NULL);

INSERT into obra
VALUES(21, 'Não recomendado para menores de 16 anos', to_date('27/01/2008','DD-MM-YYYY'), 'Cats in the Bag...', NULL, NULL);

INSERT into obra
VALUES(22, 'Não recomendado para menores de 16 anos', to_date('10/02/2008','DD-MM-YYYY'), '...And the bags in the river', NULL, NULL);

--referente a breaking bad season 2 obra id 7:
INSERT into obra
VALUES(23, 'Não recomendado para menores de 16 anos', to_date('08/03/2009','DD-MM-YYYY'), 'Seven Thirty-Seven', NULL, NULL);

INSERT into obra
VALUES(24, 'Não recomendado para menores de 16 anos', to_date('15/03/2009','DD-MM-YYYY'), 'Grilled', NULL, NULL);

--referente a breaking bad season 3 obra id 7:
INSERT into obra
VALUES(25, 'Não recomendado para menores de 16 anos', to_date('21/03/2010','DD-MM-YYYY'), 'No Más', NULL, NULL);

INSERT into obra
VALUES(26, 'Não recomendado para menores de 16 anos', to_date('28/03/2010','DD-MM-YYYY'), 'Caballo sin Nombre', NULL, NULL);

--referente a band of brothers obra id 8:
INSERT into obra
VALUES(27, 'Não recomendado para menores de 18 anos', to_date('09/09/2001','DD-MM-YYYY'), 'Currahee', NULL, NULL);

INSERT into obra
VALUES(28, 'Não recomendado para menores de 18 anos', to_date('09/09/2001','DD-MM-YYYY'), 'Day of Days', NULL, NULL);

INSERT into obra
VALUES(29, 'Não recomendado para menores de 18 anos', to_date('16/09/2001','DD-MM-YYYY'), 'Carentan', NULL, NULL);

INSERT into obra
VALUES(30, 'Não recomendado para menores de 18 anos', to_date('23/09/2001','DD-MM-YYYY'), 'Replacements', NULL, NULL);

--referente a chernobyl obra id 10:
INSERT into obra
VALUES(31, 'Não recomendado para menores de 16 anos', to_date('06/05/2019','DD-MM-YYYY'), '1:23:45', NULL, NULL);

INSERT into obra
VALUES(32, 'Não recomendado para menores de 16 anos', to_date('13/05/2019','DD-MM-YYYY'), 'Please Remain Calm', NULL, NULL);

INSERT into obra
VALUES(33, 'Não recomendado para menores de 16 anos', to_date('20/05/2019','DD-MM-YYYY'), 'Open Wide, O Earth', NULL, NULL);

INSERT into obra
VALUES(34, 'Não recomendado para menores de 16 anos', to_date('27/05/2019','DD-MM-YYYY'), 'The Happiness of All Mankind', NULL, NULL);

INSERT into obra
VALUES(35, 'Não recomendado para menores de 16 anos', to_date('03/06/2019','DD-MM-YYYY'), 'Vichnaya Pamyat', NULL, NULL);

--ESTUDIO:
INSERT into estudio
VALUES(22,'Paramount','https://www.paramount.com/');

INSERT into estudio
VALUES(23,'Warner Bros','https://www.warnerbros.com/');

INSERT into estudio
VALUES(24,'Universal Pictures','http://universalpictures.com/');

INSERT into estudio
VALUES(25,'New Line Cinema','https://www.warnerbros.com/company/divisions');

INSERT into estudio
VALUES(26,'Sony Pictures','http://www.sonypictures.com/');
INSERT into estudio
VALUES(27,'Estudio generico','about:blank');

--GENERO:
INSERT into genero
VALUES('Drama');

INSERT into genero
VALUES('Ação');

INSERT into genero
VALUES('Aventura');

INSERT into genero
VALUES('Crime');

INSERT into genero
VALUES('Ficção');

INSERT into genero
VALUES('Documentário');

INSERT into genero
VALUES('Terror');

--FILME:
INSERT into filme
VALUES('175 minutes'::interval,1);

INSERT into filme
VALUES('152 minutes'::interval,2);

INSERT into filme
VALUES('195 minutes'::interval,3);

INSERT into filme
VALUES('201 minutes'::interval,4);

insert into filme
values('198 minutes'::INTERVAL,5);

insert into filme
VALUES('100 minutes'::interval,36);

--SERIE_TV:
INSERT into serie_tv
VALUES('BBC',6);

INSERT into serie_tv
VALUES('Netflix',7);

INSERT into serie_tv
VALUES('BBC',8);

INSERT into serie_tv
VALUES('HBO',9);

INSERT into serie_tv
VALUES('HBO',10);

--COMPOE:
INSERT into compoe
VALUES(17,1,'The Godfather Soundtrack');

INSERT into compoe
VALUES(11,2,'The Dark Knight Original Motion Picture Soundtrack');

INSERT into compoe
VALUES(17,3,'The Godfather pt II Soundtrack');

INSERT into compoe
VALUES(9,4,'Schindlers List Soundtrack');

INSERT into compoe
VALUES(90,5,'Sr. Dos Anéis');

INSERT into compoe
VALUES(11,6,'Terra 2');

INSERT into compoe
VALUES(90,7,NULL);

INSERT into compoe
VALUES(90,8, NULL);

INSERT into compoe
VALUES(11,9, 'terra');

INSERT into compoe
VALUES(90,10, NULL);

INSERT into compoe
VALUES(11,11, 'Terra 2');

INSERT into compoe
VALUES(11,12, 'Terra 2');

INSERT into compoe
VALUES(11,13, 'Terra 2');

INSERT into compoe
VALUES(11,14, 'Terra 2');

INSERT into compoe
VALUES(11,15, 'Terra 2');

INSERT into compoe
VALUES(11,16, 'Terra');

INSERT into compoe
VALUES(11,17, 'Terra');

INSERT into compoe
VALUES(11,18, 'Terra');

INSERT into compoe
VALUES(11,19, 'Terra');

INSERT into compoe
VALUES(90,20, NULL);

INSERT into compoe
VALUES(90,21, NULL);

INSERT into compoe
VALUES(90,22, NULL);

INSERT into compoe
VALUES(90,23, NULL);

INSERT into compoe
VALUES(90,24, NULL);

INSERT into compoe
VALUES(90,25, NULL);

INSERT into compoe
VALUES(90,26, NULL);

INSERT into compoe
VALUES(90,27, NULL);

INSERT into compoe
VALUES(90,28, NULL);

INSERT into compoe
VALUES(90,29, NULL);

INSERT into compoe
VALUES(90,30, NULL);

INSERT into compoe
VALUES(90,31, NULL);

INSERT into compoe
VALUES(90,32, NULL);

INSERT into compoe
VALUES(90,33, NULL);

INSERT into compoe
VALUES(90,34, NULL);

INSERT into compoe
VALUES(90,35, NULL);

INSERT into compoe
VALUES(90,36, NULL);

--PRODUZ:
INSERT into produz
VALUES(91,1);

INSERT into produz
VALUES(8,2);

INSERT into produz
VALUES(7,3);
       
INSERT into produz
VALUES(91,4);

INSERT into produz
VALUES(91,5);

INSERT into produz
VALUES(91,6);

INSERT into produz
VALUES(18,7);

INSERT into produz
VALUES(91,8);

INSERT into produz
VALUES(91,9);
 
INSERT into produz
VALUES(91,10);

INSERT into produz
VALUES(91,11);

INSERT into produz
VALUES(91,12);

INSERT into produz
VALUES(91,13);

INSERT into produz
VALUES(91,14);

INSERT into produz
VALUES(91,15);

INSERT into produz
VALUES(91,16);

INSERT into produz
VALUES(91,17);

INSERT into produz
VALUES(91,18);

INSERT into produz
VALUES(91,19);

INSERT into produz
VALUES(18,20);

INSERT into produz
VALUES(18,21);

INSERT into produz
VALUES(18,22);

INSERT into produz
VALUES(18,23);

INSERT into produz
VALUES(18,24);

INSERT into produz
VALUES(18,25);

INSERT into produz
VALUES(18,26);

INSERT into produz
VALUES(91,27);

INSERT into produz
VALUES(91,28);

INSERT into produz
VALUES(91,29);

INSERT into produz
VALUES(91,30);

INSERT into produz
VALUES(91,31);

INSERT into produz
VALUES(91,32);

INSERT into produz
VALUES(91,33);

INSERT into produz
VALUES(91,34);

INSERT into produz
VALUES(91,35);

insert into produz
VALUES(1,36);

insert into produz
VALUES(3,36);

insert into produz
VALUES(4,36);

insert into produz
VALUES(14,36);

insert into produz
VALUES(15,36);

--ESCREVE:
INSERT into escreve
VALUES(19,1);

INSERT into escreve
VALUES(8,2);

INSERT into escreve
VALUES(19,3);

INSERT into escreve
VALUES(92,4);
       
INSERT into escreve
VALUES(92,5);
       
INSERT into escreve
VALUES(28,6);

INSERT into escreve
VALUES(18,7);

INSERT into escreve
VALUES(92,8);

INSERT into escreve
VALUES(28,9);
       
INSERT into escreve
VALUES(14,10);

INSERT into escreve
VALUES(28,11);

INSERT into escreve
VALUES(28,12);

INSERT into escreve
VALUES(28,13);

INSERT into escreve
VALUES(28,14);

INSERT into escreve
VALUES(28,15);

INSERT into escreve
VALUES(28,16);

INSERT into escreve
VALUES(28,17);

INSERT into escreve
VALUES(28,18);

INSERT into escreve
VALUES(28,19);

INSERT into escreve
VALUES(18,20);

INSERT into escreve
VALUES(18,21);

INSERT into escreve
VALUES(18,22);

INSERT into escreve
VALUES(18,23);

INSERT into escreve
VALUES(18,24);

INSERT into escreve
VALUES(18,25);

INSERT into escreve
VALUES(18,26);

INSERT into escreve
VALUES(92,27);

INSERT into escreve
VALUES(92,28);

INSERT into escreve
VALUES(92,29);

INSERT into escreve
VALUES(92,30);

INSERT into escreve
VALUES(14,31);

INSERT into escreve
VALUES(14,32);

INSERT into escreve
VALUES(14,33);

INSERT into escreve
VALUES(14,34);

INSERT into escreve
VALUES(14,35);

INSERT into escreve
VALUES(92,36);

--DIRIGE:

insert into dirige
VALUES(7,1);

insert into dirige
VALUES(8,2);

insert into dirige
VALUES(7,3);

insert into dirige
VALUES(20,4);

insert into dirige
VALUES(93,5);

insert into dirige
VALUES(93,6);

insert into dirige
VALUES(18,7);

insert into dirige
VALUES(93,8);

insert into dirige
VALUES(93,9);

insert into dirige
VALUES(15,10);

insert into dirige
VALUES(93,11);

insert into dirige
VALUES(93,12);

insert into dirige
VALUES(93,13);

insert into dirige
VALUES(93,14);

insert into dirige
VALUES(93,15);

insert into dirige
VALUES(93,16);

insert into dirige
VALUES(93,17);

insert into dirige
VALUES(93,18);

insert into dirige
VALUES(93,19);

insert into dirige
VALUES(18,20);

insert into dirige
VALUES(18,21);

insert into dirige
VALUES(18,22);

insert into dirige
VALUES(93,23);

insert into dirige
VALUES(18,24);

insert into dirige
VALUES(93,25);

insert into dirige
VALUES(18,26);

insert into dirige
VALUES(93,27);

insert into dirige
VALUES(93,28);

insert into dirige
VALUES(93,29);

insert into dirige
VALUES(93,30);

insert into dirige
VALUES(15,31);

insert into dirige
VALUES(15,32);

insert into dirige
VALUES(15,33);

insert into dirige
VALUES(15,34);

insert into dirige
VALUES(15,35);

insert into dirige
VALUES(93,36);

--ATUA 

insert into atua
VALUES(22,1,'Don Vito Corleone');

insert into atua
VALUES(25,1,'Michael');

insert into atua
VALUES(23,2,'Bruce Wayne / Batman');

insert into atua
VALUES(24,2,'Joker');

insert into atua
VALUES(94,2,'Alfred');

insert into atua
VALUES(26,3,'Vito Corleone');

insert into atua
VALUES(25,3,'Michael');

insert into atua
VALUES(94,4,'Ellen Hich');

insert into atua
VALUES(94,5,'Gandalf');

insert into atua
VALUES(28,6,'Narrador');

insert into atua
VALUES(27,7,'Walter White');

insert into atua
VALUES(29,7,'Jesse Pinkman');

insert into atua
VALUES(94,7,'Hank Schrader');

insert into atua
VALUES(94,8,'Lewis Nixon');

insert into atua
VALUES(28,9,'Narrador');

insert into atua
VALUES(94,10,'Valery Legazov');

insert into atua
VALUES(28,11,'Narrador');

insert into atua
VALUES(28,12,'Narrador');

insert into atua
VALUES(28,13,'Narrador');

insert into atua
VALUES(28,14,'Narrador');

insert into atua
VALUES(28,15,'Narrador');

insert into atua
VALUES(28,16,'Narrador');

insert into atua
VALUES(28,17,'Narrador');

insert into atua
VALUES(28,18,'Narrador');

insert into atua
VALUES(28,19,'Narrador');

insert into atua
VALUES(27,20,'Walter White');

insert into atua
VALUES(29,20,'Jesse Pinkman');

insert into atua
VALUES(94,20,'Hank Schrader');

insert into atua
VALUES(27,21,'Walter White');

insert into atua
VALUES(29,21,'Jesse Pinkman');

insert into atua
VALUES(94,21,'Hank Schrader');

insert into atua
VALUES(27,22,'Walter White');

insert into atua
VALUES(29,22,'Jesse Pinkman');

insert into atua
VALUES(94,22,'Hank Schrader');

insert into atua
VALUES(27,23,'Walter White');

insert into atua
VALUES(29,23,'Jesse Pinkman');

insert into atua
VALUES(94,23,'Hank Schrader');

insert into atua
VALUES(27,24,'Walter White');

insert into atua
VALUES(29,24,'Jesse Pinkman');

insert into atua
VALUES(94,24,'Hank Schrader');

insert into atua
VALUES(27,25,'Walter White');

insert into atua
VALUES(29,25,'Jesse Pinkman');

insert into atua
VALUES(94,25,'Hank Schrader');

insert into atua
VALUES(27,26,'Walter White');

insert into atua
VALUES(29,26,'Jesse Pinkman');

insert into atua
VALUES(94,26,'Hank Schrader');

insert into atua
VALUES(94,27,'Lewis Nixon');

insert into atua
VALUES(94,28,'Lewis Nixon');

insert into atua
VALUES(94,29,'Lewis Nixon');

insert into atua
VALUES(94,30,'Lewis Nixon');

insert into atua
VALUES(94,31,'Valery Legazov');

insert into atua
VALUES(94,32,'Valery Legazov');

insert into atua
VALUES(94,33,'Valery Legazov');

insert into atua
VALUES(94,34,'Valery Legazov');

insert into atua
VALUES(94,35,'Valery Legazov');

insert into atua
VALUES(1,36,'genérico');

insert into atua
VALUES(3,36,'genérico');

insert into atua
VALUES(4,36,'genérico');

insert into atua
VALUES(14,36,'genérico');

insert into atua
VALUES(15,36,'genérico');

--FEITA:
insert into feita
VALUES(22,1);

insert into feita
VALUES(23,2);

insert into feita
VALUES(23,3);

insert into feita
VALUES(24,4);

insert into feita
VALUES(25,5);

insert into feita
VALUES(26,6);

insert into feita
VALUES(22,7);

insert into feita
VALUES(23,8);

insert into feita
VALUES(26,9);

insert into feita
VALUES(24,10);

insert into feita
VALUES(26,11);

insert into feita
VALUES(26,12);

insert into feita
VALUES(26,13);

insert into feita
VALUES(26,14);

insert into feita
VALUES(26,15);

insert into feita
VALUES(26,16);

insert into feita
VALUES(26,17);

insert into feita
VALUES(26,18);

insert into feita
VALUES(26,19);

insert into feita
VALUES(22,20);

insert into feita
VALUES(22,21);

insert into feita
VALUES(22,22);

insert into feita
VALUES(22,23);

insert into feita
VALUES(22,24);

insert into feita
VALUES(22,25);

insert into feita
VALUES(22,26);

insert into feita
VALUES(23,27);

insert into feita
VALUES(23,28);

insert into feita
VALUES(23,29);

insert into feita
VALUES(23,30);

insert into feita
VALUES(24,31);

insert into feita
VALUES(24,32);

insert into feita
VALUES(24,33);

insert into feita
VALUES(24,34);

insert into feita
VALUES(24,35);

insert into feita
VALUES(27,36);

--CLASSIFICADO:
insert into classificado
values('Drama',1);

insert into classificado
values('Crime',1);

insert into classificado
values('Ação',2);

insert into classificado
values('Aventura',2);

insert into classificado
values('Drama',3);

insert into classificado
values('Crime',3);

insert into classificado
values('Drama',4);

insert into classificado
values('Ficção',5);

insert into classificado
values('Aventura',5);

insert into classificado
values('Documentário',6);

insert into classificado
values('Drama',7);

insert into classificado
values('Crime',7);

insert into classificado
values('Drama',8);

insert into classificado
values('Ação',8);

insert into classificado
values('Documentário',9);

insert into classificado
values('Drama',10);

insert into classificado
values('Documentário',11);

insert into classificado
values('Documentário',12);

insert into classificado
values('Documentário',13);

insert into classificado
values('Documentário',14);

insert into classificado
values('Documentário',15);

insert into classificado
values('Documentário',16);

insert into classificado
values('Documentário',17);

insert into classificado
values('Documentário',18);

insert into classificado
values('Documentário',19);

insert into classificado
values('Drama',20);

insert into classificado
values('Crime',20);

insert into classificado
values('Drama',21);

insert into classificado
values('Crime',21);

insert into classificado
values('Drama',22);

insert into classificado
values('Crime',22);

insert into classificado
values('Drama',23);

insert into classificado
values('Crime',23);

insert into classificado
values('Drama',24);

insert into classificado
values('Crime',24);

insert into classificado
values('Drama',25);

insert into classificado
values('Crime',25);

insert into classificado
values('Drama',26);

insert into classificado
values('Crime',26);

insert into classificado
values('Drama',27);

insert into classificado
values('Ação',27);

insert into classificado
values('Drama',28);

insert into classificado
values('Ação',28);

insert into classificado
values('Drama',29);

insert into classificado
values('Ação',29);

insert into classificado
values('Drama',30);

insert into classificado
values('Ação',30);

insert into classificado
values('Drama',31);

insert into classificado
values('Drama',32);

insert into classificado
values('Drama',33);

insert into classificado
values('Drama',34);

insert into classificado
values('Drama',35);

insert into classificado
values('Drama',36);

--EPISODIO:

--referente a planet earth 2:
insert into episodio
VALUES('49 minutes'::interval,1,1,11,6);
insert into episodio
VALUES('40 minutes'::interval,2,1,12,6);
insert into episodio
VALUES('47 minutes'::interval,3,1,13,6);
insert into episodio
VALUES('48 minutes'::interval,4,1,14,6);
insert into episodio
VALUES('47 minutes'::interval,5,1,15,6);

--referente a planet earth 1:
insert into episodio
VALUES('49 minutes'::interval,1,1,16,9);
insert into episodio
VALUES('46 minutes'::interval,1,1,17,9);
insert into episodio
VALUES('50 minutes'::interval,1,1,18,9);
insert into episodio
VALUES('52 minutes'::interval,1,1,19,9);

--referente a breaking bad season 1:
insert into episodio
VALUES('58 minutes'::interval,1,1,20,7);
insert into episodio
VALUES('56 minutes'::interval,2,1,21,7);
insert into episodio
VALUES('50 minutes'::interval,3,1,22,7);

--referente a breaking bad season 2:
insert into episodio
VALUES('52 minutes'::interval,1,2,23,7);
insert into episodio
VALUES('55 minutes'::interval,2,2,24,7);

--referente a breaking bad season 3:
insert into episodio
VALUES('56 minutes'::interval,1,3,25,7);
insert into episodio
VALUES('57 minutes'::interval,2,3,26,7);

--referente a band of brothers:
insert into episodio
VALUES('48 minutes'::interval,1,1,27,8);
insert into episodio
VALUES('46 minutes'::interval,2,1,28,8);
insert into episodio
VALUES('40 minutes'::interval,3,1,29,8);
insert into episodio
VALUES('45 minutes'::interval,4,1,30,8);

--referente a chernobyl:
insert into episodio
VALUES('50 minutes'::interval,1,1,31,10);
insert into episodio
VALUES('48 minutes'::interval,2,1,32,10);
insert into episodio
VALUES('51 minutes'::interval,3,1,33,10);
insert into episodio
VALUES('55 minutes'::interval,4,1,34,10);
insert into episodio
VALUES('49 minutes'::interval,5,1,35,10);

---------------------------------------------------------------------------------------------------------------------------

--VISÃO

--Visao com todas obras (filmes, series e episodios), cast, sua funcao e seu papel/album
Create or replace view AllWorksAndCast as
select id_obra, titulo, nome, 'compositor' as funcao, album as observacao
from obra join compoe on id_obra = compoe.fk_obra_id_obra join pessoa on fk_pessoa_id_pessoa = id_pessoa
UNION
select id_obra, titulo, nome, 'produtor' as funcao, NULL as observacao
from obra join produz on id_obra = produz.fk_obra_id_obra join pessoa on fk_pessoa_id_pessoa = id_pessoa
UNION
select id_obra, titulo, nome, 'roteirista' as funcao, NULL as observacao
from obra join escreve on id_obra = escreve.fk_obra_id_obra join pessoa on fk_pessoa_id_pessoa = id_pessoa
UNION
select id_obra, titulo, nome, 'diretor' as funcao, NULL as observacao
from obra join dirige on id_obra = dirige.fk_obra_id_obra join pessoa on fk_pessoa_id_pessoa = id_pessoa
UNION
select id_obra, titulo, nome, 'ator' as funcao, papel as observacao
from obra join atua on id_obra = atua.fk_obra_id_obra join pessoa on fk_pessoa_id_pessoa = id_pessoa
order by id_obra, titulo, funcao;

---------------------------------------------------------------------------------------------------------------------------

--CONSULTAS

/*
No mínimo duas delas devem necessitar serem respondidas com a cláusula group by (isto é, a resposta deve  combinar atributos e totalizações sobre grupos ). Dentre essas, pelo menos uma deve incluir também a cláusula  Having.
*/

--Consulta do gênero mais popular entre os filmes
select nome_genero as genero, count (id_obra) as nro_obras
from genero join classificado on genero.nome_genero = classificado.fk_genero_nome_genero join obra on fk_obra_id_obra = id_obra join filme on id_obra = filme.fk_obra_id_obra
group by genero
order by nro_obras desc;

--Consulta de quais generos entre filmes tem media de receita maior que $ 300 000 000
select nome_genero as genero, avg (receita) as receita_media
from genero join classificado on genero.nome_genero = classificado.fk_genero_nome_genero join obra on fk_obra_id_obra = id_obra join filme on id_obra = filme.fk_obra_id_obra
group by genero
having avg (receita) > 300000000
order by receita_media desc;

/*
No mínimo duas delas devem necessitar serem respondidas com subconsulta (isto é, não existe formulação equivalente usando apenas joins);
*/

--Nome da produtora que fez a obra com maior orçamento e o respectivo orçamento da obra
SELECT nome, orcamento
from estudio join feita on estudio.id_estudio = feita.fk_estudio_id_estudio join obra on feita.fk_obra_id_obra = obra.id_obra
where orcamento = (SELECT MAX(orcamento)
				from obra) ;

--Consulta nome das pessoas que já trabalharam como ator e diretor
SELECT DISTINCT nome 
from pessoa join produz on id_pessoa = fk_pessoa_id_pessoa
where nome IN (SELECT DISTINCT nome 
                          from pessoa join atua on id_pessoa = fk_pessoa_id_pessoa);

/*
No mínimo uma delas (diferente das consultas acima) deve necessitar do operador NOT EXISTS para  responder questões do tipo TODOS ou NENHUM que <referencia> (isto é, não existe formulação  equivalente usando simplesmente joins ou subconsultas com (NOT) IN ou demais operadores relacionais)
*/

--O nome dos atores que não atuaram em nenhum filme que 'ator genérico' atuou
select distinct nome
from pessoa pess
where pessoa_tipo & '00001' = '00001' and not EXISTS (select *
                  from pessoa join atua on pessoa.id_pessoa = atua.fk_pessoa_id_pessoa join obra on fk_obra_id_obra = id_obra natural join filme
                  where nome = 'Ator Genérico' AND
                  fk_obra_id_obra in ( select DISTINCT fk_obra_id_obra
                                      from pessoa join atua on pessoa.id_pessoa = atua.fk_pessoa_id_pessoa join obra on fk_obra_id_obra = id_obra natural join filme
                                      where nome = pess.nome));

/*
No mínimo duas consultas devem utilizar a visão definida no item anterior.
*/

--Os nomes das obras que foram feitas pelo estúdio 22 e que o gênero dessas obras são classificados como ‘Drama’
SELECT DISTINCT titulo
from allworksandcast join feita on fk_obra_id_obra = id_obra
where fk_estudio_id_estudio = '22' and id_obra in (SELECT DISTINCT fk_obra_id_obra
                                        from classificado
                                        WHERE fk_genero_nome_genero = 'Drama');

--Nome do compositor de albuns de cada filme e o respectivo estúdio produtor
SELECT allworksandcast.nome as nome_compositor, titulo, estudio.nome as nome_estudio
from allworksandcast join filme on id_obra = fk_obra_id_obra join feita on allworksandcast.id_obra = feita.fk_obra_id_obra join estudio on feita.fk_estudio_id_estudio = estudio.id_estudio
WHERE funcao = 'compositor'
ORDER by titulo;

/*
3 consultas livres restantes.
*/

--O nome da emissora e do estúdio que produziu cada série 
select serie_tv.emissora, obra.titulo, estudio.nome as estudio
from serie_tv join obra on serie_tv.fk_obra_id_obra = obra.id_obra join feita on obra.id_obra = feita.fk_obra_id_obra join estudio on feita.fk_estudio_id_estudio = estudio.id_estudio
order by emissora;

--Consulta do nome dos atores que fizeram o filme ‘Poderoso chefão’ e seu respectivo papel
SELECT DISTINCT nome, papel
from pessoa JOIN atua on id_pessoa = fk_pessoa_id_pessoa join obra on fk_obra_id_obra = id_obra natural join filme
WHERE titulo = 'O Poderoso Chefão';

--quantas obras de cada gênero cada estúdio produziu
SELECT DISTINCT nome, nome_genero, COUNT(nome_genero) as contagem
from estudio join feita on feita.fk_estudio_id_estudio = estudio.id_estudio join obra on feita.fk_obra_id_obra = obra.id_obra NATURAL join classificado join genero on genero.nome_genero = classificado.fk_genero_nome_genero 
GROUP by estudio.nome, genero.nome_genero
ORDER by contagem DESC;

--STORED PROCEDURE e triggers

/*
Procedimento que recebe o id_pessoa de uma pessoa e uma string com seu possível novo tipo_pessoa a partir de triggers. A ideia é manter consistente o tipo_pessoa da tabela pessoa quando inserções são feitas nas tabelas compoe, produz, escreve, dirige e atua. Assim, quando uma pessoa que não era diretora dirige uma obra pela primeira vez, seu pessoa_tipo é atualizado para refletir seu novo “rótulo de função já exercida”
*/

create or replace function update_pessoa_tipo() returns trigger as $$
declare
	a SMALLINT;
    b bit(5);
begin
  a = new.fk_pessoa_id_pessoa;
  b  = TG_ARGV[1];
  if b = '10000' then
    update pessoa set pessoa_tipo = pessoa_tipo | b where a = id_pessoa;
  end if;
  if b = '01000' then
    update pessoa set pessoa_tipo = pessoa_tipo | b where a = id_pessoa;
  end if;
  if b = '00100' then
    update pessoa set pessoa_tipo = pessoa_tipo | b where a = id_pessoa;
  end if;
  if b = '00010' then
    update pessoa set pessoa_tipo = pessoa_tipo | b where a = id_pessoa;
  end if;
  if b = '00001' then
    update pessoa set pessoa_tipo = pessoa_tipo | b where a = id_pessoa;
  end if;
RETURN null;
end; $$ language plpgsql;

CREATE or replace TRIGGER mantem_atualizado_compositor
	AFTER insert ON compoe
    FOR EACH row
    execute procedure update_pessoa_tipo(new,'10000');

CREATE or replace TRIGGER mantem_atualizado_produtor
	AFTER insert ON produz
    FOR EACH row
    execute procedure update_pessoa_tipo(new,'01000');

CREATE or replace TRIGGER mantem_atualizado_roteirista
	AFTER insert ON escreve
    FOR EACH row
    execute procedure update_pessoa_tipo(new,'00100');

CREATE or replace TRIGGER mantem_atualizado_diretor
	AFTER insert ON dirige
    FOR EACH row
    execute procedure update_pessoa_tipo(new,'00010');

CREATE or replace TRIGGER mantem_atualizado_ator
	AFTER insert ON atua
    FOR EACH row
    execute procedure update_pessoa_tipo(new,'00001');
