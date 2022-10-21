create table especialidade
(code	char(3) not null,
nomee 	varchar(20) not null,	
primary key(code));

create table medico
(codm		char(3) not null,
nomem		varchar(20) not null,	
salario     float not null,
uf 	        char(2) not null,
code        char(2) not null,
primary key(codm),
foreign key (code) references especialidade);

create table paciente
(codp	char(3) not null,
nomep 	varchar(20) not null,	
UF 	  char(2) not null,
primary key(codp));

create table consulta
(codp	char(3)	 not null,	
codm 	char(3)	 not null,	
data	char(5)	 not null,
primary key(codp,codm,data),
foreign key (codp) references paciente,
foreign key (codm) references medico);


insert into especialidade values ('e1','oftalmologia');
insert into especialidade values ('e2','pediatria');
insert into especialidade values ('e3','endocrinologia');
insert into especialidade values ('e4','geriatria');
insert into especialidade values ('e5','cirugia plastica');
insert into especialidade values ('e6','obstetricia');
insert into especialidade values ('e7','clinica geral');
insert into especialidade values ('e8','cardiologia');


insert into medico values ('m1','ricardo',115000,'RS','e1');
insert into medico values ('m2','romualdo',35000,'BA','e2');
insert into medico values ('m3','roberto',45000,'SP','e2');
insert into medico values ('m4','sheila',25000,'RS','e3');
insert into medico values ('m5', 'paula',75000,'RS', 'e4');
insert into medico values ('m6', 'tereza',85000,'BA', 'e5');
insert into medico values ('m7', 'carla', 15000,'SP','e2');
insert into medico values ('m8', 'jose', 15000,'SP','e6');
insert into medico values ('m9', 'elisa', 15000,'SP','e6');
insert into medico values ('m10', 'raul', 15000,'SP','e8');
insert into medico values ('m11', 'lisa', 15000,'SP','e8');


insert into paciente values ('p1','joao','RS');
insert into paciente values ('p2','pedro','SP');
insert into paciente values ('p3','maria','BA');
insert into paciente values ('p4','jose','RS');
insert into paciente values ('p5','marta','SP');
insert into paciente values ('p6','paulo','BA');
insert into paciente values ('p7','roberto','BA');



insert into consulta values ('p1','m2','01/01');
insert into consulta values ('p1','m2','01/02');
insert into consulta values ('p1','m3','01/02');
insert into consulta values ('p2','m2','01/01');
insert into consulta values ('p2','m3','01/02');
insert into consulta values ('p2','m1','01/02');
insert into consulta values ('p2','m10','01/02');
insert into consulta values ('p5','m4','01/02');
insert into consulta values ('p3', 'm2', '01/01');
insert into consulta values ('p4', 'm4', '01/01');
insert into consulta values ('p4', 'm1', '01/01');
insert into consulta values ('p4', 'm11', '01/01');
insert into consulta values ('p4', 'm3', '01/01');
insert into consulta values ('p1', 'm5', '01/01');
insert into consulta values ('p1', 'm5', '01/02');
insert into consulta values ('p6', 'm5', '01/02');
insert into consulta values ('p6', 'm6', '01/02');
insert into consulta values ('p6', 'm2', '03/03');
insert into consulta values ('p7', 'm6', '01/02');
insert into consulta values ('p7', 'm2', '01/02');
insert into consulta values ('p1', 'm7', '04/04');
insert into consulta values ('p2', 'm7', '05/05');

select * 
from especialidade;

select * 
from medico;

select * 
from paciente;

select * 
from consulta;
