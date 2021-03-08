# Especificações Do Projeto


## Personas

> 1-João tem 36 anos, sendo 10 anos como engenheiro civil trabalha em uma grande construtora vistoriando as obras em andamento em Belo Horizonte, está acima do peso e possui diabetes , pretende começar a realizar pequenas caminhadas depois do expediente para melhorar a qualidade de vida, para ter mais tempo para suas duas filhas e esposa, João está aguardando a liberação de vendas da vacina ja que e do grupo de risco e se preocupa com a saúde.

> 2-Joana uma senhora simpática de 65 anos aposentada, trabalhava como dentista em uma clínica popular atendendo crianças, nós fins de semana gosta de convocar os filhos e netos para um almoço em sua casa, adora dançar e festejar mas devido a asma se cansa rápido, com a pandemia ficou sem poder fazer as coisas que gostava, esta a procura de vacinas em clínicas privadas.


## Histórias de Usuários

 A aplicação de uma vacina confere imunização ativa ou passiva ao indivíduo. Para que este processo se dê com segurança, 
 as atividades de imunização devem ser cercadas de cuidados, adotando-se procedimentos adequados antes, durante e após a 
 administração dos imunobiológicos. Como um usuário do aplicativo, é esperado o retorno das seguintes informações:

|Persona    | Historia  | Motivo |
|------|-----------------------------------------|----|
| Usuario | Desejo me cadastrar no sistema | Fazer login e ter acesso a seus dados |
| Usuario | Desejo fazer agendamento para tomar a vacina | Agendar um dia para tomar a vacina |
| Usuario | Devo ter acesso ao meus dados| Ficar ciente dos seus dados/grupo de prioridade |
| Usuario | O intervalo entre uma dose e outra | caso o imunobiológico cuja proteção exija mais de uma dose |
| Usuario | Devo saber as marcas das vacinas | Ter ciencia de quais vacinas estão disponiveis |
| Usuario | Ser informado do número de doses do esquema básico e dos reforços | Se tiver mais de uma dose, o paciente devera fazer um novo agendamento |

## Requisitos

As tabelas que se seguem apresentam os requisitos funcionais e não funcionais que detalham o escopo do projeto.

### Requisitos Funcionais

|ID    | Descrição do Requisito  | Prioridade |
|------|-----------------------------------------|----|
| RF-001 | Permitir cadastro de usuário | Alta |
| RF-002 | Definir grupo de prioridade do usuário | Alta |
| RF-003 | Permitir agendamendo para usuários dentro do grupo prioritario | Alta |
| RF-004 | Exibir grupo de prioridade do usuário | Média |
| RF-005 | Permitir desmarcar agendamento | Média |
| RF-006 | Notificar usuário caso agendamento disponivel para grupo prioritario | Baixa | 
| RF-007 | Exibir data de agendamento | Média |
| RF-008 | Permitir a escolha de dia e hora da consulta (dentro dos dias disponiveis para o grupo prioritario). | Média |
| RF-009 | Exibir marcas de vacinas disponiveis | Baixa |
| RF-010 | Exibir informaçoes da vacina a ser tomada | Baixa |



### Requisitos não Funcionais

|ID     | Descrição do Requisito  |Prioridade |
|-------|-------------------------|----|
| RNF-001 | O sistema deve exibir em qual grupo de prioridade do usuário na tela inicial | Média |
| RNF-002 | O Sistema deve exibir caso o usuario esteja dentro do grupo prioritario a ser atendido | Média |
| RNF-003 | O sistema deve ser acessivel | Média |

## Restrições

As principais restrições da grande maioria dos projeto são: o prazo,  escopo (planejamento) e custos. E como não poderia ser diferente 
aqui, os itens apresentados na tabela a seguir estão relacionados à isso, e eles impactam a forma como o projeto será gerenciado.

|ID| Restrição                                                                 |
|--|---------------------------------------------------------------------------|
|01| Cronograma: projeto divido em etapas com prazos de entrega pré definidos  |
|02| Ferramentas de desenvolvimento do projeto são limitadas                   |
|03| Custo ZERO: utilização de softwares livres para o desenvolvimento         |
|04| A equipe de projeto será limitada ao máximo dos 4 alunos do grupo         |
|05| Paradigmas e linguagens de programação determinadas pelo professor        |
