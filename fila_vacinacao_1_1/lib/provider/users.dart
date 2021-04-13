import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  UserModel item;

  void loadUser(UserModel user) {
    item.nome = user.nome;
    item.email = user.email;
    item.sexo = user.sexo;
    item.datadenascimento = user.datadenascimento;
    item.profissao = user.profissao;
    item.cpf = user.cpf;
    item.endereco = user.endereco;
    item.numero = user.numero;
    item.cep = user.cep;
    item.fone = user.fone;
    notifyListeners();
  }
}
