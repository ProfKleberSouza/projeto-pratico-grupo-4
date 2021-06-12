import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/pages/acessibilidade_page.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'package:fila_vacinacao_1_1/routes/app_routes.dart';
import 'package:fila_vacinacao_1_1/services/auth.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  FontModel font;

  loadFont() async {
    font = await Acessibilidade().getFontModel();
  }

  void out() async {
    await Auth().singOut();
  }

  @override
  void initState() {
    super.initState();
    loadFont();
  }

  _settings() {
    return Container(
      child: FutureBuilder(
        future: loadFont(),
        builder: (context, snapshot) {
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
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 1,
                        child: Row(
                          children: [
                            SizedBox.fromSize(
                              size: (Size.fromWidth(353)),
                              child: ClipRect(
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: Colors.blue,
                                    onTap: () {
                                      if (mounted) {
                                        setState(() {});
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AcessPage()),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.accessibility_new,
                                            size: 60,
                                          ),
                                          Text(
                                            "Acessibilidade",
                                            style: TextStyle(
                                                fontSize: Acessibilidade()
                                                    .fontSize(font)),
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
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 1,
                        child: Row(
                          children: [
                            SizedBox.fromSize(
                              size: (Size.fromWidth(353)),
                              child: ClipRect(
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: Colors.blue,
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            size: 60,
                                          ),
                                          Text(
                                            "Notificações",
                                            style: TextStyle(
                                                fontSize: Acessibilidade()
                                                    .fontSize(font)),
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
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 1,
                        child: Row(
                          children: [
                            SizedBox.fromSize(
                              size: (Size.fromWidth(353)),
                              child: ClipRect(
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: Colors.blue,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.SOBRE_PAGE);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.info_outlined,
                                            size: 60,
                                          ),
                                          Text(
                                            "       Sobre      ",
                                            style: TextStyle(
                                                fontSize: Acessibilidade()
                                                    .fontSize(font)),
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
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 1,
                        child: Row(
                          children: [
                            SizedBox.fromSize(
                              size: (Size.fromWidth(353)),
                              child: ClipRect(
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: Colors.blue,
                                    onTap: out,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.exit_to_app_rounded,
                                            size: 50,
                                          ),
                                          Text(
                                            "        Sair      ",
                                            style: TextStyle(
                                                fontSize: Acessibilidade()
                                                    .fontSize(font)),
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
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _settings(),
    );
  }
}
