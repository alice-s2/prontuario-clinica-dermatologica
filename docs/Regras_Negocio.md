# Regras de Negócio
### RN01 - Cadastro de Pacientes
O sistema não deve permitir o cadastro de dois pacientes com o mesmo CPF.

### RN02 - Prontuário
Existe somente um prontuário médico para cada paciente, que é criado no momento do cadastro.

### RN03 - Segurança
Médicos e secretárias devem possuir login, senha e CRM (para médicos) únicos no sistema.

### RN04 - Dependência de Consulta
Uma consulta só pode ser agendada se estiver com paciente, secretária e dermatologista vinculados.

### RN05 - Atendimento Vinculado
Todo registro do atendimento deve, obrigatoriamente, estar vinculado a uma consulta agendada anteriormente.

### RN06 - Ciclo do Atendimento
Uma consulta gera apenas um relatório de atendimento.

### RN07 - Catálogo
O dermatologista deve apenas prescrever medicamentos, solicitar procedimentos ou atribuir diagnósticos que estão inclusos no catálogo médico.
