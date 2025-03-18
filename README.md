# Projeto de Banco de Dados para Oficina Mecânica

Este documento apresenta uma visão geral do projeto de banco de dados desenvolvido para uma oficina mecânica, incluindo todos os arquivos criados e suas descrições.

## Visão Geral do Projeto

O projeto consiste na criação de um esquema lógico completo para o contexto de uma oficina mecânica, desde a modelagem até a implementação do banco de dados com queries SQL complexas. O sistema permite o gerenciamento de clientes, veículos, funcionários, serviços, peças, fornecedores e ordens de serviço.

## Arquivos do Projeto

1. **requisitos_oficina.md**
   - Análise detalhada dos requisitos para o sistema de oficina mecânica
   - Identificação das entidades principais, relacionamentos e requisitos adicionais

2. **esquema_logico.md**
   - Esquema lógico do banco de dados com todas as tabelas, atributos e relacionamentos
   - Definição de chaves primárias, estrangeiras, restrições e índices

3. **script_criacao_banco.sql**
   - Script SQL para criação do banco de dados e todas as tabelas
   - Implementação de chaves, índices, restrições e triggers

4. **script_insercao_dados.sql**
   - Script SQL para inserção de dados de teste em todas as tabelas
   - Dados realistas para clientes, veículos, funcionários, serviços, peças, etc.

5. **consultas_complexas.sql**
   - 15 consultas SQL complexas que atendem a todos os requisitos solicitados
   - Implementação de SELECT, WHERE, expressões derivadas, ORDER BY, HAVING e JOINs

6. **documentacao_consultas.md**
   - Documentação detalhada de cada consulta SQL
   - Explicação do propósito, cláusulas utilizadas e como respondem às perguntas de negócio

7. **verificacao_requisitos.md**
   - Verificação da cobertura de todos os requisitos solicitados
   - Confirmação de que todas as cláusulas SQL foram implementadas

## Funcionalidades Implementadas

O banco de dados implementa as seguintes funcionalidades:

1. **Gestão de Clientes e Veículos**
   - Cadastro de clientes (pessoa física e jurídica)
   - Registro de veículos associados a cada cliente
   - Histórico de serviços por veículo

2. **Controle de Serviços**
   - Catálogo de serviços oferecidos pela oficina
   - Registro de tempo estimado e valor padrão
   - Categorização dos serviços

3. **Gestão de Estoque**
   - Controle de peças e seus fornecedores
   - Monitoramento de estoque atual e mínimo
   - Atualização automática do estoque ao utilizar peças

4. **Ordens de Serviço**
   - Registro completo de serviços realizados
   - Controle de peças utilizadas
   - Cálculo automático de valores
   - Acompanhamento de status

5. **Gestão de Funcionários**
   - Registro de mecânicos e suas especialidades
   - Controle de serviços realizados por cada funcionário
   - Análise de eficiência e produtividade

6. **Relacionamento com Fornecedores**
   - Cadastro de fornecedores
   - Registro de preços e prazos de entrega
   - Análise de custo-benefício

7. **Análise Financeira**
   - Faturamento por período e categoria
   - Margem de lucro por peça e serviço
   - Identificação de clientes mais lucrativos

## Consultas Implementadas

As consultas SQL implementadas respondem a perguntas de negócio como:

1. Quais são todos os clientes cadastrados na oficina?
2. Quais veículos têm mais de 50.000 km rodados?
3. Qual é a margem de lucro para cada peça vendida?
4. Quais são os serviços mais caros oferecidos pela oficina?
5. Quais clientes tiveram gastos totais acima de R$ 500,00 em serviços?
6. Qual é o histórico completo de serviços e peças para cada veículo?
7. Quais peças estão com estoque abaixo do mínimo recomendado?
8. Qual é o faturamento mensal da oficina, detalhado por tipo de serviço?
9. Quais funcionários realizaram mais de 3 serviços e têm média de valor acima de R$ 200?
10. Quais são os clientes mais lucrativos, considerando o valor total gasto e a frequência de visitas?
11. Quais peças nunca foram utilizadas em nenhuma ordem de serviço?
12. Qual é o ranking de funcionários por valor total de serviços realizados?
13. Qual é a eficiência dos funcionários em relação ao tempo estimado vs. tempo real gasto nos serviços?
14. Quais são todos os serviços e peças com seus respectivos valores, ordenados por categoria?
15. Quais fornecedores oferecem as peças com melhor custo-benefício para cada categoria?

## Conclusão

O projeto desenvolveu um banco de dados completo e funcional para uma oficina mecânica, atendendo a todos os requisitos solicitados. As consultas SQL implementadas permitem uma análise detalhada dos dados, fornecendo informações valiosas para a gestão do negócio.
