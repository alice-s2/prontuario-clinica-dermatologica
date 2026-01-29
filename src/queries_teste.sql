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

-- 4. Exibir nome e celular de todos pacientes diagnosticados com melasma. 
select paciente.nome as "Paciente", paciente.celular
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
