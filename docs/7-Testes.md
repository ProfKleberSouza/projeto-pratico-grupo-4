# Avaliação da Aplicação

<span style="color:red">Pré-requisitos: <a href="6-Implementação.md"> Projeto da Solução</a></span>


Os testes serão realizados nas seguintes telas e funcionalidades:

- Login;
- Tela de agendamento;
- Confirmar agendamento;
- Configuração da acessibilidade;
- Configuração da notificação;
- Tela de Editar usuário;
- Seleção de Data/Hora;
- Frame de Confirmado;

## Plano de Testes
### Tipos de testes aplicado
- Teste de regressão: Esse consiste em realizar testes a cada versão de um software, onde se modificam-se funcionalidades. Desse modo, evita-se que erros que foram corrigidos antes no software antes voltem a aparecer na hora de se incrementar algo novo a ele.

- Teste de unidade: Testa-se unidades menores de um software, de modo isolado, para ver se todas funcionam adequadamente;

- Teste de integração: Depois das unidades testadas, realiza-se uma verificação se elas funcionam juntas, integradas. Pode ocorrer delas apresentarem incompatibilidades ao funcionarem em conjunto, mesmo após terem sido aprovadas no teste de unidade;

- Teste de usabilidade: Esse teste é feito por um pequeno grupo de usuários para ver se o software satisfaz as suas necessidades.  Nesse teste analisa-se como o usuário usa o sistema, verificando onde ele tem mais dificuldade. Ouve-se também suas impressões, porém é preciso confrontá-las com as observações do avaliador;

### Funcionalidades testadas:
| Tela/Funcionalidade | Testes |
|-------------------------|-----------------------------|
| Login | Teste de unidade, Teste de integração, Teste de usabilidade |
| Tela de agendamento | Teste de unidade, Teste de integração, Teste de usabilidade |
| Confirmar agendamento | Teste de unidade, Teste de integração |
| Acessibilidade | Teste de unidade, Teste de integração, Teste de usabilidade |
| Notificações | Teste de unidade, Teste de integração, Teste de usabilidade |
| Tela de Editar usuário | Teste de unidade, Teste de integração, Teste de usabilidade |
| Seleção de Data/Hora | Teste de unidade, Teste de integração |
| Frame de Confirmação | Teste de unidade, Teste de integração |
| Logout | Teste de unidade, Teste de integração, Teste de usabilidade |

E a cada funcionalidade implementada foi feito o Teste de Regressão

### Fluxo dos testes
![Estrutura](img/FluxogramaTestes.jpg)

## Ferramentas de Testes

- ### [Ferramentas de Test para Flutter](https://flutter.dev/docs/testing)
- O teste de unidade testa uma única função, método ou classe.
- O teste de widget (em outras estruturas de IU chamadas de teste de componente ) testa um único widget.
- O teste de integração testa um aplicativo completo ou uma grande parte de um aplicativo.

## Avaliação

| Funcionalidade | Teste de unidade | Teste de integração | Teste de regressão | Teste de usabilidade |
|---------------------|---------------------|---------------------|---------------------|---------------------|
| Login | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | 
| Tela de agendamento | :heavy_check_mark: OK | :x: NOK | :x: NOK | :heavy_check_mark: OK |
| Confirmar agendamento | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | 
| Acessibilidade | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | 
| Notificações | ❗ NOK | ❗ NOK | ❗ NOK | 
| Tela de Editar usuário | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | 
| Seleção de Data/Hora | :heavy_check_mark: OK | :x: NOK |  :x: NOK |
| Frame de Confirmação | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK | 
| Logout | :heavy_check_mark: OK | :heavy_check_mark: OK | :heavy_check_mark: OK |  :heavy_check_mark: OK | 



