import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Save_Editing { Save, Editing }

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  static final GlobalKey<FormState> _formKeyInfoPage = GlobalKey<FormState>();
  Save_Editing _saveEditing = Save_Editing.Editing;
  Map<String, String> _formData = {};
  var _snapshots = FirebaseFirestore.instance;
  bool disable = true;

  void upadateData() {
    var user = FirebaseAuth.instance;
    user.authStateChanges();
    _snapshots.collection('usuarios').doc(user.currentUser.uid).update({
      'nome': _formData['nome'],
      'email': _formData['email'],
      'datadenascimento': _formData['datadenascimento'],
      'numero': _formData['numero'],
      'endereco': _formData['endereco'],
      'cep': _formData['cep'],
      'cpf': _formData['cpf'],
      'fone': _formData['fone'],
      'profissao': _formData['profissao'],
      'sexo': _formData['sexo'],
    });
  }

  void _switchMode() {
    final isValid = _formKeyInfoPage.currentState.validate();
    if (_saveEditing == Save_Editing.Save) {
      setState(() {
        if (isValid) {
          _formKeyInfoPage.currentState.save();
          upadateData();
          _saveEditing = Save_Editing.Editing;
          disable = true;
        }
      });
    } else {
      setState(() {
        disable = false;
        _saveEditing = Save_Editing.Save;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance;
    user.authStateChanges();
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _snapshots
            .collection('usuarios')
            .doc(user.currentUser.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var item = snapshot.data.data();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: Form(
                    key: _formKeyInfoPage,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          initialValue: item['nome'],
                          maxLength: 50,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Nome:', border: OutlineInputBorder()),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => _formData['nome'] = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            if (value.length < 10) {
                              return 'Minimo 10 caracteres';
                            }

                            return null;
                          },
                        ),
                        TextFormField(
                          initialValue: item['email'],
                          maxLength: 30,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'E-mail:',
                              border: OutlineInputBorder()),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => _formData['email'] = value,
                          enabled: disable,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 150,
                              child: TextFormField(
                                initialValue: item['datadenascimento'],
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  labelText: 'Nascimento:',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) =>
                                    _formData['datadenascimento'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (!value.contains('/')) {
                                    return 'Ex:DD/MM/AA';
                                  }
                                  if (value.length < 10) {
                                    return 'Informe um data válida';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 150,
                              child: TextFormField(
                                initialValue: item['profissao'],
                                maxLength: 15,
                                autocorrect: true,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Profissão:',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) =>
                                    _formData['profissao'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value.length > 15) {
                                    return 'Máximo 15 caracteres';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height: 70,
                              child: TextFormField(
                                initialValue: item['cpf'],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'CPF:',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) => _formData['cpf'] = value,
                                enabled: disable,
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 70,
                              child: TextFormField(
                                initialValue: item['sexo'],
                                maxLength: 10,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Sexo',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) => _formData['sexo'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value.length > 10) {
                                    return 'Máximo 10 caracteres';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          child: TextFormField(
                            initialValue: item['endereco'],
                            maxLength: 30,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Endereço:',
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => _formData['endereco'] = value,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              if (value.length > 30) {
                                return 'Máximo 30 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height: 70,
                              child: TextFormField(
                                initialValue: item['numero'],
                                maxLength: 5,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Numero:',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) => _formData['numero'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value.length > 5) {
                                    return 'Máximo 5 caracteres';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 70,
                              child: TextFormField(
                                initialValue: item['cep'],
                                maxLength: 8,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'CEP:',
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) => _formData['cep'] = value,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value.length > 8) {
                                    return 'Máximo 8 caracteres';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          child: TextFormField(
                            initialValue: item['fone'],
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Fone:',
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => _formData['fone'] = value,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              if (value.length > 11) {
                                return 'Máximo 11 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 30),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_saveEditing == Save_Editing.Save)
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(0, 0, 255, 0.9),
                                              Color.fromRGBO(0, 191, 255, 0.9)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.save,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      onPressed: _switchMode,
                                    ),
                                  ),
                                ),
                              if (_saveEditing == Save_Editing.Editing)
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(0, 0, 255, 0.9),
                                            Color.fromRGBO(0, 191, 255, 0.9)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      onPressed: _switchMode,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
