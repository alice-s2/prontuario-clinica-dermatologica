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
	extract(year from age(paciente.data_nasc)) || ' anos' as idade,
	'(' || substring(paciente.celular, 1, 2) || ') ' || substring(paciente.celular, 3, 1) || ' ' || substring(paciente.celular, 4, 4) || '-' || substring(paciente.celular, 8, 4) as celular,
	endereco.cidade,
	prontuario.tipo_pele,
	prontuario.historico_familiar,
	alergia.nome_alergia as alergia
from paciente join endereco on paciente.id_paciente = endereco.id_paciente
			  join prontuario on paciente.id_paciente = prontuario.id_paciente
			  left join paciente_alergia on paciente.id_paciente = paciente_alergia.id_paciente
			  left join alergia on alergia.id_alergia = paciente_alergia.id_alergia;

select * from vw_ficha_paciente;
