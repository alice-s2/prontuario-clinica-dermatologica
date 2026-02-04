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

select f_formatar_celular(4);   -- (48) 9 7777-2222
