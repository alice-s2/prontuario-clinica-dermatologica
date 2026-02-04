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

update procedimento set preco = 110.00 where procedimento.id_proc = 1;
