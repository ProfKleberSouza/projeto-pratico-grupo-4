import 'package:fila_vacinacao_1_1/services/auth.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void out() {
      Auth().singOut();
    }

    return Scaffold(
      body: ListView(
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.notifications,
                                        size: 60,
                                      ),
                                      Text(
                                        "Notificações",
                                        style: TextStyle(fontSize: 36),
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.accessibility_new,
                                        size: 60,
                                      ),
                                      Text(
                                        "Acessibilidade",
                                        style: TextStyle(fontSize: 36),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.info_outlined,
                                        size: 60,
                                      ),
                                      Text(
                                        "Sobre",
                                        style: TextStyle(fontSize: 36),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.exit_to_app_rounded,
                                        size: 50,
                                      ),
                                      Text(
                                        "Sair",
                                        style: TextStyle(fontSize: 36),
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
      ),
    );
  }
}
