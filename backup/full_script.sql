-- SCRIPT SQL >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
create table paciente(
	id_paciente serial primary key,
	nome varchar(100) not null,
	cpf varchar(11) unique not null,
	sexo char(1),
	data_nasc date not null,
	celular varchar(11)
);

create table endereco(
	id_endereco serial primary key,
	cep char(8),
	uf char(2),
	cidade varchar(100),
	bairro varchar(100),
	rua varchar(100),
	numero varchar(10),
	complemento varchar(50),
	id_paciente integer unique references paciente(id_paciente)
);

create table prontuario(
	id_paciente integer primary key references paciente(id_paciente),
	historico_familiar varchar(255),
	tipo_pele varchar(255)
);

create table alergia(
	id_alergia serial primary key,
	nome_alergia varchar(100)
);

create table paciente_alergia(
	id_paciente integer references paciente(id_paciente),
	id_alergia integer references alergia(id_alergia),
	primary key (id_paciente, id_alergia)
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
	observacao text,
	data_hora timestamp not null,
	status varchar(20) check (status in('Agendada', 'Realizada', 'Cancelada')),
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
	conduta text,
	id_consulta integer unique references consulta(id_consulta)
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

alter table registra add column valor_proc numeric(10, 2);

select * from secretaria;        truncate table secretaria restart identity cascade;
select * from dermatologista;    truncate table dermatologista restart identity cascade;

select * from diagnostico;       truncate table diagnostico restart identity cascade;
select * from medicamento;       truncate table medicamento restart identity cascade;
select * from procedimento;      truncate table procedimento restart identity cascade;
select * from alergia;           truncate table alergia restart identity cascade;

select * from paciente;          truncate table paciente restart identity cascade;
select * from endereco;          truncate table endereco restart identity cascade;

select * from prontuario;        truncate table prontuario restart identity cascade;
select * from paciente_alergia;  truncate table paciente_alergia restart identity cascade;

select * from consulta;          truncate table consulta restart identity cascade;
select * from atendimento;       truncate table atendimento restart identity cascade;   

select * from identifica;        truncate table identifica restart identity cascade;
select * from prescreve;         truncate table prescreve restart identity cascade;
select * from registra;          truncate table registra restart identity cascade;

-- BASE DE DADOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--- Profissionais da Clínica ---

insert into secretaria (nome, login, senha) values 
('Ana Paula', 'anap.sec', 'senha123'),           
('Beatriz Souza', 'bia.sec', 'gatosfofos'),      
('Cláudia Ribeiro', 'clau.sec', 'admin123');     

insert into dermatologista (nome, crm, login, senha) values
('Dra. Adriane Carvalho', '12345-RS', 'adri.carvalho', 'segredo123'), 
('Dra. Fernanda Lima', '67890-RS', 'nanda.lima', 'dermato2026');      

--- Catálogo Médico ---

insert into medicamento (nome_comercial, principio_ativo) values
('Roacutan', 'Isotretinoina'),               
('Azellan', 'Ácido Azelaico'),               
('Pant', 'Minoxidil'),                       
('Daivobet', 'Calcipotriol + Betametasona'), 
('Vitanol-A', 'Tretinoína'),                 
('Adinos', 'Desonida');                      

insert into procedimento (nome, preco) values
('Consulta Dermatológica (Rotina)', 100.00),
('Consulta Especializada (Tricologia)', 300.00),
('Limpeza de Pele Profunda', 180.00),               
('Peeling Químico Renovador', 250.00),              
('Aplicação de Toxina Botulínica (Botox)', 1200.00),
('Biópsia de Pele (Punch)', 350.00),                
('Cauterização de Verrugas', 150.00),              
('Sessão de Laser CO2 Fracionado', 800.00);         

insert into diagnostico (nome_doenca, codigo_cid) values
('Acne Cística', 'L70.0'),             
('Melasma', 'L81.1'),                  
('Alopecia Androgenética', 'L64'),     
('Dermatite Atópica', 'L20'),          
('Psoríase Vulgar', 'L40.0'),          
('Carcinoma Basocelular', 'C44');  

insert into alergia (nome_alergia) values
('Sulfa'),
('Dipirona'),
('Penicilina'),
('AAS (Ácido Acetilsalicílico)'),
('Anti-inflamatórios (AINEs)'),
('Lidocaína'),      
('Látex'),          
('Iodo'),           
('Esparadrapo'),    
('Timerosal'),      
('Níquel'),         
('Parabenos'),      
('Frutos do Mar'), 
('Corantes'),       
('Glúten'),         
('Lactose');

--- Cadastro de Pacientes ---

insert into paciente (nome, cpf, sexo, data_nasc, celular) values 
('Letícia Mendes', '11122233344', 'F', '2003-05-15', '54999998888'),
('Maria Helena', '22233344455', 'F', '1970-09-12', '54998887474'),
('Roberto Campos', '33344455566', 'M', '1995-02-20', '51988881111'),
('Juliana Costa', '44455566677', 'F', '1988-11-05', '48977772222'),
('Sr. Antônio Silva', '55566677788', 'M', '1955-07-30', '41999993333'),
('Carlos Silva', '12345678900', 'M', '1990-05-15', '11999998888');

insert into endereco (cep, uf, cidade, bairro, rua, numero, complemento, id_paciente) values
('99010000', 'RS', 'Passo Fundo', 'Centro', 'Av. Brasil Oeste', '560', null, 1),
('99025000', 'RS', 'Passo Fundo', 'Vila Vera Cruz', 'R. Caxias', '120', null, 2),
('90010000', 'RS', 'Porto Alegre', 'Centro Histórico', 'Rua dos Andradas', '100', null, 3),
('88025000', 'SC', 'Florianópolis', 'Agronômica', 'Av. Beira Mar Norte', '200', null, 4),
('80020000', 'PR', 'Curitiba', 'Centro', 'Rua XV de Novembro', '500', null, 5),
('01001000', 'SP', 'São Paulo', 'Centro', 'Rua das Flores', '123', 'Apto 10', 6);

insert into prontuario (id_paciente, historico_familiar, tipo_pele) values
(1, 'Mãe tem melasma', 'Oleosa'),
(2, 'Histórico de câncer de pele na família', 'Seca/sensível'),
(3, 'Pai e avô calvos', 'Mista'),
(4, 'Psoríase na família materna', 'Ressecada'),
(5, 'Diabético. Histórico de melanoma no irmão', 'Danificada pelo sol'),
(6, 'Pai com histórico de psoríase.', 'Fototipo III, seca e sensível.');

--- Fluxo de Atendimento ---

insert into consulta (observacao, data_hora, status, valor, forma_pagamento, id_paciente, id_sec, id_derm) values
('Queixa de acne. Agendado procedimento de limpeza.', '2026-01-30 14:00', 'Realizada', 280.00, 'Pix', 1, 1, 1),
('Avaliação de manchas e peeling.', '2026-02-02 10:30', 'Realizada', 350.00, 'Cartão Crédito', 2, 1, 1),
('Primeira consulta capilar (Tricologia).', '2026-02-03 16:00', 'Realizada', 300.00, 'Dinheiro', 3, 2, 2), 
('Urgência: Lesão suspeita no nariz.', '2026-02-04 09:00', 'Realizada', 450.00, 'Cartão Débito', 5, 2, 2), 
('Paciente desmarcou por motivo de viagem.', '2026-02-05 11:00', 'Cancelada', 0.00, NULL, 4, 3, 1), 
('Retorno para nova Limpeza de Pele solicitada pela paciente.', '2026-03-01 14:00', 'Agendada', 280.00, NULL, 1, 1, 1),
('Queixa de manchas no braço', '2026-03-05 16:00:00', 'Agendada', 350.00, NULL, 6, 1, 1); 

--- Detalhes do Atendimento ---

insert into atendimento (queixa, exame_fisico, hipotese_diagnostica, conduta, id_consulta) values
('Aumento de espinhas doloridas.', 'Pústulas inflamadas grau 3.', 'Acne Severa', 'Início de isotretinoína.', 1),
('Manchas escuras.', 'Hiperpigmentação malar.', 'Melasma Misto', 'Uso de ácidos e filtro solar.', 2),
('Entradas aumentando e cabelo ralo no topo.', 'Teste de tração positivo. Afinamento folicular.', 'Alopecia Androgenética', 'Iniciar minoxidil tópico e agendar laser.', 3),
('Ferida no nariz que não cicatriza há 3 meses.', 'Lesão perolada com vasos visíveis na asa nasal esquerda.', 'Carcinoma Basocelular', 'Realizar biópsia punch imediata para confirmação.', 4),
('Manchas avermelhadas no antebraço direito há 5 dias.', 'Lesões descamativas, sem sinais de infecção. Teste de sensibilidade positivo.', 'Dermatite Atópica', 'Realizada biópsia. Prescrito corticoide. Retorno em 15 dias.', 7);

--- Tabelas de Ligação --- 

insert into paciente_alergia (id_paciente, id_alergia) values
(2, 1), 
(4, 2); 

insert into identifica (id_atendimento, id_diag) values
(1, 1),
(2, 2), 
(3, 3), 
(4, 6),
(5, 4);

insert into prescreve (id_atendimento, id_med, modo_de_uso) values
(1, 1, '1 cápsula ao dia (Roacutan) 20mg'),
(2, 2, 'Camada fina à noite (Azellan)'),
(3, 3, 'Aplicar 1ml no couro cabeludo 2x ao dia (Minoxidil)'),
(5, 3, 'Aplicar fina camada no local 2x ao dia por 7 dias');

insert into registra (id_atendimento, id_proc, regiao_corpo) values
(1, 1, 'Avaliação Geral'), (1, 3, 'Face completa'),  -- consulta (R$100) + limpeza (R$180)
(2, 1, 'Avaliação Geral'), (2, 4, 'Face (Zona T)'),  -- consulta (R$100) + peeling (R$250)
(3, 2, 'Couro Cabeludo'),  -- consulta especializada tricologica (R$300)
(4, 1, 'Avaliação Geral'), (4, 6, 'Asa nasal esquerda'),  -- consulta (R$100) + biópsia (R$350)
(5, 1, 'Avaliação Geral'), (5, 6, 'Antebraço Direito');   -- consulta (R110) + biópsia (R$350)

-- CONSULTAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

select * from secretaria;       
select * from dermatologista;    

select * from diagnostico;       
select * from medicamento;       
select * from procedimento;      
select * from alergia;           

select * from paciente;          
select * from endereco;          

select * from prontuario;       
select * from paciente_alergia;  

select * from consulta order by id_consulta;          
select * from atendimento;        

select * from identifica;        
select * from prescreve;         
select * from registra;         

-- 1. Exibir nome do paciente, nome do dermatologista e data/hora de todas as consultas agendadas ou realizadas.
select paciente.nome as "Paciente", dermatologista.nome as "Dermatologista", consulta.data_hora
from consulta join paciente on paciente.id_paciente = consulta.id_paciente
			  join dermatologista on dermatologista.id_derm = consulta.id_derm
where consulta.status in ('Agendada', 'Realizada');

-- 2. Exibir faturamento da clínica apenas com as consultas que foram realizadas.
select sum(consulta.valor) as "Faturamento"
from consulta
where consulta.status = 'Realizada';

-- 3. Exibir o nome e a quantidade de consultas que cada dermatologista atendeu.
select dermatologista.nome, count(consulta.id_derm)
from consulta join dermatologista on consulta.id_derm = dermatologista.id_derm
group by dermatologista.nome;

-- 4. Exibir nome, idade e celular de todos pacientes diagnosticados com melasma. 
select paciente.nome as "Paciente", f_calcular_idade(paciente.id_paciente) || ' anos' as idade, f_formatar_celular(paciente.id_paciente) as celular
from consulta join paciente on consulta.id_paciente = paciente.id_paciente
			  join atendimento on consulta.id_consulta = atendimento.id_consulta
			  join identifica on atendimento.id_atendimento = identifica.id_atendimento
			  join diagnostico on identifica.id_diag = diagnostico.id_diag
where diagnostico.nome_doenca ilike 'melasma';

-- 5. Exibir o nome do medicamento e o modo de uso que foi receitado para a paciente 'Letícia Mendes' em sua consulta.
select medicamento.nome_comercial as "Medicamento", prescreve.modo_de_uso as "Modo de Uso"
from consulta join paciente on consulta.id_paciente = paciente.id_paciente
			  join atendimento on consulta.id_consulta = atendimento.id_consulta
			  join prescreve on atendimento.id_atendimento = prescreve.id_atendimento
			  join medicamento on prescreve.id_med = medicamento.id_med
where paciente.nome = 'Letícia Mendes';

-- 6. Exibir ficha completa do paciente (nome, cidade/estado, alergias e historico familiar)
select paciente.nome as paciente, endereco.cidade || '/' || endereco.uf as localidade, alergia.nome_alergia, prontuario.historico_familiar
from paciente join endereco on paciente.id_paciente = endereco.id_paciente
			  left join paciente_alergia on paciente.id_paciente = paciente_alergia.id_paciente
			  left join alergia on paciente_alergia.id_alergia = alergia.id_alergia
			  join prontuario on paciente.id_paciente = prontuario.id_paciente;

-- VIEWS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- 1. View de Ranking
-- Mostra quais procedimentos geram mais receita para a clínica
create or replace view vw_ranking_procedimentos as
select 
	procedimento.nome as procedimento, 
	count(registra.id_proc) as total, 
	sum(procedimento.preco) as faturamento
from procedimento join registra on procedimento.id_proc = registra.id_proc
where procedimento.nome not ilike 'Consulta%'
group by procedimento.nome, procedimento.preco
order by faturamento desc;

select * from vw_ranking_procedimentos;

-- 2. View de Agenda
-- Exibe detalhadamente a lista de pacientes agendados
create or replace view vw_agenda as
select 
	to_char(consulta.data_hora, 'DD/MM/YYYY HH24:MI') as data_hora, 
	paciente.nome as paciente,
	f_formatar_celular(paciente.id_paciente) as celular,
	dermatologista.nome as dermatologista,
	consulta.status
from consulta join paciente on consulta.id_paciente = paciente.id_paciente
			  join dermatologista on consulta.id_derm = dermatologista.id_derm;

select * from vw_agenda; 

-- 3. View da Ficha do Paciente
-- Exibe a ficha completa do paciente
create or replace view vw_ficha_paciente as
select
	paciente.nome as paciente,
	f_calcular_idade(paciente.id_paciente) || ' anos' as idade,
	f_formatar_celular(paciente.id_paciente) as celular,
	'R$ ' || f_total_gasto(paciente.id_paciente) as total_investido,
	endereco.cidade,
	prontuario.tipo_pele,
	prontuario.historico_familiar,
	alergia.nome_alergia as alergia
from paciente join endereco on paciente.id_paciente = endereco.id_paciente
			  join prontuario on paciente.id_paciente = prontuario.id_paciente
			  left join paciente_alergia on paciente.id_paciente = paciente_alergia.id_paciente
			  left join alergia on alergia.id_alergia = paciente_alergia.id_alergia;

select * from vw_ficha_paciente;

-- FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- 1. Calcular quanto um paciente já gastou na clínica.
create or replace function f_total_gasto(var_id_paciente integer)
returns numeric(10,2) 
language plpgsql
as $$
declare
	v_total numeric(10,2);
begin
	select sum(valor) into v_total
	from consulta 
	where id_paciente = var_id_paciente;
	
	return coalesce(v_total, 0.00);
end;
$$;

-- Teste
select f_total_gasto(1);   -- 560.00 

-- 2. Calcular idade dos pacientes
create or replace function f_calcular_idade(var_id_paciente integer)
returns integer
language plpgsql
as $$
declare
	var_idade integer;
begin
	select extract(year from age(data_nasc)) into var_idade
	from paciente
	where id_paciente = var_id_paciente;

	return var_idade;
end;
$$;

-- Teste
select f_calcular_idade(1);	  -- 22

-- 3. Formatar saída número de celular
create or replace function f_formatar_celular(var_id_paciente integer)
returns text
language plpgsql
as $$
declare
	var_celular text;
begin
	select 
	'(' || substring(celular, 1, 2) || ') ' || substring(celular, 3, 1) || ' ' || substring(celular, 4, 4) || '-' || substring(celular, 8, 4) into var_celular
	from paciente
	where var_id_paciente = id_paciente;

	return coalesce(var_celular, 'Sem celular');
end;
$$;

-- Teste
select f_formatar_celular(4);   -- (48) 9 7777-2222

-- TRIGGERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- 1. Auditoria de preços da tabela 'Procedimento'.
create table log_preco(
	id_log serial primary key,
	procedimento text,
	preco_antigo decimal(10,2),
	preco_novo decimal(10,2),
	data_alteracao timestamp default current_timestamp
);

create or replace function f_log_preco() 
returns trigger
language plpgsql
as $$
begin
	if (old.preco <> new.preco) then
		insert into log_preco (procedimento, preco_antigo, preco_novo, data_alteracao)
		values (old.nome, old.preco, new.preco, now());
	end if;
	
	return new;
end;
$$;

create trigger t_log_preco
after update on procedimento
for each row
	execute function f_log_preco();

-- Teste
update procedimento set preco = 110.00 where procedimento.id_proc = 1;

select * from log_preco;   
select * from procedimento order by id_proc;

-- 2. Atualização de status, assim que a dermatologista atender a consulta e preencher a tabela 'atendimento', altera na tabela 'consulta' o status para 'realizada'.
create or replace function f_att_status() 
returns trigger
language plpgsql
as $$
begin
	update consulta set status = 'Realizada' where id_consulta = new.id_consulta;
	
	return new;
end;
$$;

create trigger t_att_status
after insert on atendimento
for each row
	execute function f_att_status();

-- Teste
insert into atendimento (queixa, exame_fisico, hipotese_diagnostica, conduta, id_consulta)
values ('Retorno mês 2 Roacutan. Limpeza de pele', 'Melhora visível, lábios ressecados', 'Acne Grau 1', 'Manter isotretinoína, reforçar hidratação labial', 6);
insert into registra (id_atendimento, id_proc, regiao_corpo) values (5, 3, 'Face Completa');
insert into registra (id_atendimento, id_proc, regiao_corpo) values (5, 1, 'Face Completa');
insert into identifica (id_atendimento, id_diag) values (5, 1);
insert into prescreve (id_atendimento, id_med, modo_de_uso) values (5, 1, 'Tomar 1 cápsula no almoço (Manter dose)');
update consulta set forma_pagamento = 'Pix' where id_consulta = 6;

select * from consulta order by id_consulta;
select * from atendimento;
select * from procedimento;  select * from registra;
select * from medicamento;   select * from prescreve;
select * from diagnostico;   select * from identifica;

-- 3. Toda vez que houver um insert na tabela 'Registra', os preços atuais dos procedimentos vão ser adicionados automaticamente.
create or replace function f_add_valor()
returns trigger
language plpgsql
as $$
begin
	select preco into new.valor_proc
	from procedimento 
	where id_proc = new.id_proc;

	return new;
end;
$$;

create trigger t_add_valor
before insert on registra
for each row
	execute function f_add_valor();

-- Correção de registros antigos que ficaram com NULL
update registra set valor_proc = p.preco
from procedimento p
where registra.id_proc = p.id_proc and registra.valor_proc is null;

select * from registra;
select * from procedimento;
select * from log_preco;






