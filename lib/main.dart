import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
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
          regressionLineaire(),
          Text("Test"),
        ]),
      ),
    );
  }
}

//////////////////////////// REGRESSION LINEAIRE ////////////////////////////

class regressionLineaire extends StatefulWidget {
  @override
  State createState() => _MyState();
}

class _MyState extends State<regressionLineaire> {
  final int decimalRange = 5;

  void changeColor() {
    setState(() {
      //TODO: Ajouter Textfields
      //TODO: Ajouter infiniteScroll
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(shrinkWrap: false, children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Point 1 : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  width: 115,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,5}')),
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'X',
                    ),
                  ),
                ),
                SizedBox(
                  width: 115,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,5}')),
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Y',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {},
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    textColor: const Color.fromRGBO(0, 160, 227, 1),
                    child: const Text("+",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {},
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    textColor: const Color.fromRGBO(0, 160, 227, 1),
                    child: const Text("Envoyer",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(220, 20, 60, 1))),
                    onPressed: () {},
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    textColor: const Color.fromRGBO(220, 20, 60, 1),
                    child: const Text("-",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ],
        )
      ])),
    );
  }
}
