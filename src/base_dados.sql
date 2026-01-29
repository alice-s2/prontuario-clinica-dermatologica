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

--- Cadastro de Pacientes ---

insert into paciente (nome, cpf, sexo, data_nasc, endereco, celular) values 
('Letícia Mendes', '11122233344', 'F', '2003-05-15', 'Av. Brasil Oeste, 560, Centro, Passo Fundo/RS', '54999998888'),
('Maria Helena', '22233344455', 'F', '1970-09-12', 'R. Caxias, 120, Vila Vera Cruz, Passo Fundo/RS', '54998887474'),
('Roberto Campos', '33344455566', 'M', '1995-02-20', 'Rua dos Andradas, 100, Centro Histórico, Porto Alegre/RS', '51988881111'),
('Juliana Costa', '44455566677', 'F', '1988-11-05', 'Av. Beira Mar Norte, 200, Agronômica, Florianópolis/SC', '48977772222'),
('Sr. Antônio Silva', '55566677788', 'M', '1955-07-30', 'Rua XV de Novembro, 500, Centro, Curitiba/PR', '41999993333');

insert into prontuario (id_paciente, alergias, historico_familiar, tipo_pele) values
(1, 'Nenhuma', 'Mãe tem melasma', 'Oleosa'),
(2, 'Alergia a Sulfa', 'Histórico de câncer de pele na família', 'Seca/sensível'),
(3, 'Nenhuma', 'Pai e avô calvos', 'Mista'),                       
(4, 'Alergia a Dipirona', 'Psoríase na família materna', 'Ressecada'), 
(5, 'Diabético', 'Histórico de melanoma no irmão', 'Danificada pelo sol'); 

--- Fluxo de Atendimento ---

insert into consulta (observacao, data_hora, status, valor, forma_pagamento, id_paciente, id_sec, id_derm) values
('Queixa de acne. Agendado procedimento de limpeza.', '2026-01-30 14:00', 'Realizada', 280.00, 'Pix', 1, 1, 1),
('Avaliação de manchas e peeling.', '2026-02-02 10:30', 'Realizada', 350.00, 'Cartão Crédito', 2, 1, 1),
('Primeira consulta capilar (Tricologia).', '2026-02-03 16:00', 'Realizada', 300.00, 'Dinheiro', 3, 2, 2), 
('Urgência: Lesão suspeita no nariz.', '2026-02-04 09:00', 'Realizada', 450.00, 'Cartão Débito', 5, 2, 2), 
('Paciente desmarcou por motivo de viagem.', '2026-02-05 11:00', 'Cancelada', 0.00, NULL, 4, 3, 1), 
('Retorno para nova Limpeza de Pele solicitada pela paciente.', '2026-03-01 14:00', 'Agendada', 280.00, NULL, 1, 1, 1);

--- Detalhes do Atendimento ---

insert into atendimento (queixa, exame_fisico, hipotese_diagnostica, conduta, id_consulta) values
('Aumento de espinhas doloridas.', 'Pústulas inflamadas grau 3.', 'Acne Severa', 'Início de isotretinoína.', 1),
('Manchas escuras.', 'Hiperpigmentação malar.', 'Melasma Misto', 'Uso de ácidos e filtro solar.', 2),
('Entradas aumentando e cabelo ralo no topo.', 'Teste de tração positivo. Afinamento folicular.', 'Alopecia Androgenética', 'Iniciar minoxidil tópico e agendar laser.', 3),
('Ferida no nariz que não cicatriza há 3 meses.', 'Lesão perolada com vasos visíveis na asa nasal esquerda.', 'Carcinoma Basocelular', 'Realizar biópsia punch imediata para confirmação.', 4);

--- Tabelas de Ligação --- 

insert into identifica (id_atendimento, id_diag) values
(1, 1),
(2, 2), 
(3, 3), 
(4, 6); 

insert into prescreve (id_atendimento, id_med, modo_de_uso) values
(1, 1, '1 cápsula ao dia (Roacutan)'),
(2, 2, 'Camada fina à noite (Azellan)'),
(3, 3, 'Aplicar 1ml no couro cabeludo 2x ao dia (Minoxidil)');

insert into registra (id_atendimento, id_proc, regiao_corpo) values
(1, 1, 'Avaliação Geral'), (1, 3, 'Face completa'),  -- consulta (R$100) + limpeza (R$180)
(2, 1, 'Avaliação Geral'), (2, 4, 'Face (Zona T)'),  -- consulta (R$100) + peeling (R$250)
(3, 2, 'Couro Cabeludo'),  -- consulta especializada tricologica (R$300)
(4, 1, 'Avaliação Geral'), (4, 6, 'Asa nasal esquerda');  -- consulta (R$100) + biópsia (R$350)
