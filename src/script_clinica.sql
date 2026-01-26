create table paciente(
	id_paciente serial primary key,
	nome varchar(100) not null,
	cpf varchar(11) unique not null,
	sexo char(1),
	data_nasc date not null,
	endereco varchar(255),
	celular varchar(11)
);

create table prontuario(
	id_paciente integer primary key references paciente(id_paciente),
	alergias varchar(255),
	historico_familiar varchar(255),
	tipo_pele varchar(255)
);

create table secretaria(
	id_sec serial primary key,
	nome varchar(100) not null,
	login varchar(50) unique not null,
	senha varchar(255) not null
);

create table dermatologista(
	id_derm serial primary key,
	nome varchar(100) not null,
	crm varchar(15) unique not null,
	login varchar(50) unique not null,
	senha varchar(255) not null
);

create table consulta(
	id_consulta serial primary key,
	data_hora timestamp not null,
	status varchar(20),
	valor numeric(10, 2),
	forma_pagamento varchar(20),
	id_paciente integer references paciente(id_paciente),
	id_sec integer references secretaria(id_sec),
	id_derm integer references dermatologista(id_derm)
); 

create table atendimento(
	id_atendimento serial primary key,
	queixa text,
	exame_fisico text,
	hipotese_diagnostica text,
	conduta text
);

create table diagnostico(
	id_diag serial primary key,
	nome_doenca varchar(100),
	codigo_cid varchar(10)
);

create table identifica(
	id_atendimento integer references atendimento(id_atendimento),
	id_diag integer references diagnostico(id_diag),
	primary key(id_atendimento, id_diag)  
);

create table medicamento(
	id_med serial primary key,
	nome_comercial varchar(50),
	principio_ativo varchar(50)
);

create table prescreve(
	modo_de_uso varchar(100),
	id_atendimento integer references atendimento(id_atendimento),
	id_med integer references medicamento(id_med),
	primary key(id_atendimento, id_med)
);

create table procedimento(
	id_proc serial primary key,
	nome varchar(50),
	preco numeric(10, 2)
);

create table registra(
	regiao_corpo varchar(50),
	id_atendimento integer references atendimento(id_atendimento),
	id_proc integer references procedimento(id_proc),
	primary key(id_atendimento, id_proc)
);
