-- Profissionais da Clínica
insert into secretaria (nome, login, senha) values 
('Ana Paula', 'anap.sec', 'senhadificil321');

insert into dermatologista (nome, crm, login, senha) values
('Dra. Adriane Carvalho', '12345-RS', 'adri.carvalho', 'segredo123');

-- Catálogo Médico
insert into medicamento (nome_comercial, principio_ativo) values
('Roacutan', 'Isotretinoina'),
('Azellan', 'Ácido Azelaico');

insert into procedimento (nome, preco) values
('Limpeza de Pele Profunda', 180.00),
('Peeling Químico Renovador', 250.00);

insert into diagnostico (nome_doenca, codigo_cid) values
('Acne Cística', 'L70.0'),
('Melasma', 'L81.1');

-- Cadastro de Pacientes
insert into paciente (nome, cpf, sexo, data_nasc, endereco, celular) values 
('Letícia Mendes', '11122233344', 'F', '2003-05-15', 'Av. Brasil Oeste, 560, Apto 302 (Edifício Solar), Centro, Passo Fundo/RS', '54999998888'),
('Maria Helena', '22233344455', 'F', '1970-09-12', 'R. Caxias, 120, Casa, Vila Vera Cruz, Passo Fundo/RS', '54998887474');

insert into prontuario (id_paciente, alergias, historico_familiar, tipo_pele) values
(1, 'Nenhuma', 'Mãe tem melasma', 'Oleosa'),
(2, 'Alergia a Sulfa', 'Histórico de câncer de pele na família', 'Seca/sensível');

-- Fluxo de Atendimento
insert into consulta (data_hora, status, valor, forma_pagamento, id_paciente, id_sec, id_derm) values
('2026-01-30 14:00:00', 'Realizada', 250.00, 'Pix', 1, 1, 1),
('2026-02-02 10:30:00', 'Realizada', 250.00, 'Cartão Crédito', 2, 1, 1);

insert into atendimento (queixa, exame_fisico, hipotese_diagnostica, conduta, id_consulta) values
('Aumento de espinhas doloridas no rosto e costas.', 'Pústulas inflamadas grau 3 na face e dorso.', 'Acne Severa Resistente', 'Início imediato de isotretinoína e limpeza de pele.', 1),
('Manchas escuras na testa e bochechas que pioraram no verão.', 'Hiperpigmentação castanha irregular na região malar e frontal. Sem lesões inflamatórias.', 'Melasma Misto', 'Uso de clareador noturno e indicação de peeling superficial.', 2);

-- Tabelas de Ligação
insert into identifica (id_atendimento, id_diag) values
(1, 1), 
(2, 2);

insert into prescreve (id_atendimento, id_med, modo_de_uso) values
(1, 1, 'Tomar 1 cápsula por dia após o almoço durante 6 meses'),
(2, 2, 'Aplicar uma camada fina no rosto à noite. Usar filtro solar de dia.');

insert into registra (id_atendimento, id_proc, regiao_corpo) values
(1, 1, 'Face completa e região superior das costas'),
(2, 2, 'Face completa (foco na zona T e maçãs do rosto)');
