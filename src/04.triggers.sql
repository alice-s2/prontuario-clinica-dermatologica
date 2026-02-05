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