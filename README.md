# Prontuário Eletrônico - Clínica Dermatológica
O projeto simula um prontuário eletrônico de uma clínica dermatológica, com foco em banco de dados e SQL. O objetivo é reproduzir um cenário real de armazenamento, organização e análise de informações clínicas, utilizando boas práticas de modelagem de dados.

## Objetivos do Projeto
- Desenvolver um banco de dados relacional para um prontuário eletrônico
- Aplicar conceitos de modelagem de dados (DER e normalização)
- Implementar consultas SQL para análise das informações clínicas
- Simular um ambiente real de dados de uma clínica dermatológica

## Tecnologias Utilizadas
- PostgreSQL
- pgAdmin 4

## Estrutura do Projeto
- `src/script.sql`: Script para criação das tabelas e relacionamentos
- `src/insert_dados.sql`: Script para população do banco com cenários de teste
- `src/queries_teste.sql`: Consultas SQL para validação das regras de negócio (Faturamento, Agenda, etc)
- `docs/regras_negocio.md`: Documentação detalhada das regras implementadas

## Como Rodar
1.  Crie um banco de dados no PostgreSQL chamado `clinica_dermato`
2.  Execute o arquivo `script.sql` para criar a estrutura
3.  Execute o arquivo `insert_dados.sql` para popular com dados de teste
4.  Execute os comandos de `queries_teste.sql` para visualizar os relatórios
