# Especificações Do Projeto


## Personas

> 1-Pessoas com comorbidades tais como diabetes, pressão alta, doenças cardíacas, pulmonares e respiratórias acima de 18 anos.
> 2-Pessoas na 3° idade 


## Histórias de Usuários

 A aplicação de uma vacina confere imunização ativa ou passiva ao indivíduo. Para que este processo se dê com segurança, 
 as atividades de imunização devem ser cercadas de cuidados, adotando-se procedimentos adequados antes, durante e após a 
 administração dos imunobiológicos. Como um usuário do aplicativo, é esperado o retorno das seguintes informações:

|Persona    | Historia  | Movivo |
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


### Requisitos não Funcionais

|ID     | Descrição do Requisito  |Prioridade |
|-------|-------------------------|----|
| RNF-001 | O sistema deve exibir em qual grupo de prioridade do usuário na tela inicial | Média |
| RNF-002 | O Sistema deve exibir caso o usuario esteja dentro do grupo prioritario a ser atendido | Média |
| RNF-003 | Opção de desmarcar agendamento deve estar na mesma tela que é exibido a data do agendamento | Média |

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
