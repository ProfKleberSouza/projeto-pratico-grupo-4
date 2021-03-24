import 'package:flutter/material.dart';

class User {
  final String id;
  final String cpf;
  final String nome;
  final String datadenascimento;
  final String profissao;
  final String sexo;
  final String email;
  final String endereco;
  final String numero;
  final String cep;
  final String fone;
  final String senha;

  const User(
      {this.id,
      @required this.nome,
      @required this.email,
      @required this.sexo,
      @required this.datadenascimento,
      @required this.profissao,
      @required this.cpf,
      @required this.endereco,
      @required this.numero,
      @required this.cep,
      @required this.fone,
      this.senha});
}
