import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projetm1_mobile/tabs/formulaire.dart';

import 'tabs/regression_lineaire.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "ProjetM1", home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.scatter_plot), text: "Régression Linéaire"),
              Tab(
                icon: FaIcon(FontAwesomeIcons.listOl),
                text: "Formulaire",
              ),
            ],
          ),
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Application",
            ),
          ),
        ),
        body: TabBarView(children: [
          RegressionLineaire(),
          Formulaire()
        ]),
      ),
    );
  }
}

