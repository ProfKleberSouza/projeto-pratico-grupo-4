import '../models/user.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

enum Save_Editing { Save, Editing }

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var snapshots = FirebaseFirestore.instance.collection('usuarios').snapshots();

  final _form = GlobalKey<FormState>();

  Map<String, String> _formData = {};

  Save_Editing _saveEditing = Save_Editing.Save;

  void _switchMode() {
    if (_saveEditing == Save_Editing.Editing) {
      setState(() {
        _form.currentState.save();

        _saveEditing = Save_Editing.Save;
      });
    } else {
      setState(() {
        _saveEditing = Save_Editing.Editing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green[50],
      body: StreamBuilder(
        stream: snapshots,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          if (snapshot.data.docs.length == 0) {
            return Center(
              child: Text('Nenhum usuario cadastrado'),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int i) {
                var item = snapshot.data.docChanges[i].doc;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 15, left: 15),
                      child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              initialValue: item['nome'],
                              maxLength: 50,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  labelText: 'Nome:',
                                  border: OutlineInputBorder()),
                              textInputAction: TextInputAction.next,
                              onSaved: (value) => _formData['nome'] = value,
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
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'CPF:',
                                      border: OutlineInputBorder(),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) =>
                                        _formData['cpf'] = value,
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
                                    onSaved: (value) =>
                                        _formData['sexo'] = value,
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
                                onSaved: (value) =>
                                    _formData['endereco'] = value,
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
                                    onSaved: (value) =>
                                        _formData['numero'] = value,
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
                                    onSaved: (value) =>
                                        _formData['cep'] = value,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 30),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_saveEditing == Save_Editing.Editing)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      204, 255, 153, 0.5),
                                                  Color.fromRGBO(
                                                      153, 255, 255, 0.9)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.save,
                                            size: 60,
                                            color: Colors.black,
                                          ),
                                          onPressed: _switchMode,
                                        ),
                                      ),
                                    ),
                                  if (_saveEditing == Save_Editing.Save)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    204, 255, 153, 0.5),
                                                Color.fromRGBO(
                                                    153, 255, 255, 0.9)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            size: 60,
                                            color: Colors.black,
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
                );
              });
        },
      ),
    );
  }
}
