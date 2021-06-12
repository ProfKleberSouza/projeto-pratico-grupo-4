class UserModel {
  String id;
  String nome;
  String email;
  String sexo;
  String datadenascimento;
  String cpf;
  String endereco;
  String numero;
  String cep;
  String fone;
  bool agendado;
  bool primeiraAplicacao;
  bool segundaAplicacao;
  String dataAgendadaSegundaDose;
  String dataAgendadaPrimeiraDose;
  String setor;
  String prioridade;

  UserModel(
      {this.id,
      this.nome,
      this.email,
      this.sexo,
      this.datadenascimento,
      this.setor,
      this.cpf,
      this.endereco,
      this.numero,
      this.cep,
      this.fone,
      this.agendado,
      this.primeiraAplicacao,
      this.segundaAplicacao,
      this.dataAgendadaSegundaDose,
      this.dataAgendadaPrimeiraDose,
      this.prioridade});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    sexo = json['sexo'];
    datadenascimento = json['datadenascimento'];
    setor = json['setor'];
    cpf = json['cpf'];
    endereco = json['endereco'];
    numero = json['numero'];
    cep = json['cep'];
    fone = json['fone'];
    agendado = json['agendado'];
    primeiraAplicacao = json['primeiraAplicacao'];
    segundaAplicacao = json['segundaAplicacao'];
    dataAgendadaSegundaDose = json['dataAgendadaSegundaDose'];
    dataAgendadaPrimeiraDose = json['dataAgendadaPrimeiraDose'];
    prioridade = json['prioridade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['sexo'] = this.sexo;
    data['datadenascimento'] = this.datadenascimento;
    data['setor'] = this.setor;
    data['cpf'] = this.cpf;
    data['endereco'] = this.endereco;
    data['numero'] = this.numero;
    data['cep'] = this.cep;
    data['fone'] = this.fone;
    data['agendado'] = this.agendado;
    data['primeiraAplicacao'] = this.primeiraAplicacao;
    data['segundaAplicacao'] = this.segundaAplicacao;
    data['dataAgendadaSegundaDose'] = this.dataAgendadaSegundaDose;
    data['dataAgendadaPrimeiraDose'] = this.dataAgendadaPrimeiraDose;
    data['prioridade'] = this.prioridade;
    return data;
  }
}
