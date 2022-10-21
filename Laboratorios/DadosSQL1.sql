
drop table if exists gravacao;
drop table if exists musica;
drop table if exists artista;
drop table if exists genero ;

create table genero
(codg char(3) NOT NULL primary key,
nomeg varchar(20) NOT NULL);

insert into genero
values ('g1', 'rapp');
insert into genero
values ('g2', 'pop');
insert into genero
values ('g3', 'funk');
insert into genero
values ('g4', 'rock');

create table musica
(codm char(3) NOT NULL primary key,
nomem varchar(50) NOT NULL,
ano smallint not null,
codg char(3),
downloads smallint NOT NULL,
foreign key(codg) references genero
);

insert into musica
values ('m1', 'pipa voada', 2020, 'g1', 1000);
insert into musica
values ('m2', 'amarelo', 2020, 'g1', 3000);
insert into musica
values ('m3', 'passarinhos', 2015, 'g2', 5000);
insert into musica
values ('m4', 'bum bum tam tam: remix vacina butantan', 2020, 'g3', 2000);
insert into musica
values ('m5', 'bum bum tam tam', 2017, 'g3', 20000);
insert into musica
values ('m6', 'boa sorte', 2019, 'g2', 4000);


create table artista
(coda char(3) NOT NULL primary key,
nomea varchar(30) NOT NULL,
sexo char(1) NOT NULL 
);

insert into artista 
values('a1', 'emicida', 'm');
insert into artista 
values('a2', 'rashid', 'm');
insert into artista 
values('a3', 'vanessa da mata', 'f');
insert into artista 
values('a4', 'mc fioti', 'm');
insert into artista
values( 'a5', 'projota', 'm');

create table gravacao
(codm char(3) NOT NULL,
coda char(3) NOT NULL,
primary key (coda, codm),
foreign key (coda) references artista,
foreign key (codm) references musica
);


insert into gravacao
values ('m1', 'a1');
insert into gravacao
values ('m1', 'a2');
insert into gravacao
values ('m2', 'a1');
insert into gravacao
values ('m3', 'a1');
insert into gravacao
values ('m3', 'a3');
insert into gravacao
values ('m4', 'a4');
insert into gravacao
values ('m5', 'a4' );
insert into gravacao
values ('m6', 'a3' );


