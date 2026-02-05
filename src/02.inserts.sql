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