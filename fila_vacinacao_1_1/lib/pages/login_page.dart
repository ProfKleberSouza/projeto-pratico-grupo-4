import 'package:fila_vacinacao_1_1/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  GlobalKey<FormState> _formkeyLogin = GlobalKey<FormState>();

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  String _validateEmail(String text) {
    if (!validateEmail(text)) {
      return "E-mail invalido";
    }
    return null;
  }

  void showSnack(String erro) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Text(
        erro,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ));
  }

  void singIn() async {
    final isValid = _formkeyLogin.currentState.validate();
    if (isValid) {
      Future<String> alerta = Auth().singIn(_email, _password);
      var erro = await alerta;
      if (erro != null) {
        switch (erro) {
          case "wrong-password":
            erro = "Senha inválida";
            break;
          case "user-not-found":
            erro = "Usuário não encontrado";
            break;
          case "invalid-email":
            erro = "E-mail inválido";
            break;
          default:
            erro = "Falha ao logar.Tente novamente";
        }
        showSnack(erro);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 0, 255, 0.9),
            Color.fromRGBO(0, 191, 255, 0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          "assets/Logo.png",
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: _formkeyLogin,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 315,
                            width: double.infinity,
                            child: Card(
                              elevation: 20,
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, left: 20, right: 20),
                                      child: Container(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              _email = value.trim();
                                            });
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              labelText: "E-mail",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                              ),
                                              icon: Icon(Icons.email)),
                                          validator: _validateEmail,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 20, right: 20),
                                      child: Container(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              _password = value.trim();
                                            });
                                          },
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.lock),
                                            labelText: "Senha",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return ("Informe a senha");
                                            } else if (value.length < 6) {
                                              return ("Minimo 6 caracteres");
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: singIn,
                                        child: Text(
                                          "Entrar",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue[300]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
