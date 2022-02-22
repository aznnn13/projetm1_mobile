import 'dart:developer';

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

/////////////////////////////// REGRESSION LINEAIRE ////////////////////////////

class regressionLineaire extends StatefulWidget {
  const regressionLineaire({Key? key}) : super(key: key);

  @override
  State createState() => _MyState();
}

class _MyState extends State<regressionLineaire> {
  final int decimalRange = 5;

  //////////////////////////////////////////////////////////////////////////////
  int nbPoints = 1;
  List<Widget> RowList = [];
  List<TextEditingController> listControllerX = [];
  List<TextEditingController> listControllerY = [];

  void addNewPoint() {
    TextEditingController controllerX = TextEditingController();
    TextEditingController controllerY = TextEditingController();

    listControllerX.add(controllerX);
    listControllerY.add(controllerY);

    RowList.add(Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Point " + nbPoints.toString() + " :",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              width: 115,
              child: TextField(
                controller: controllerX,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,5}')),
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'X',
                ),
              ),
            ),
            SizedBox(
              width: 115,
              child: TextField(
                controller: controllerY,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,5}')),
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Y',
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ));
    nbPoints++;
    setState(() {});
  }

  void envoyer() {
    int taille = listControllerX.length;
    for (int i = 0; i < taille; i++) {
      log("Point " +
          (i + 1).toString() +
          ": X =" +
          listControllerX[i].text.toString() +
          ", Y = " +
          listControllerY[i].text.toString());
    }
  }

  void removeNewPoint() {
    if (RowList.isNotEmpty) {
      int lastIndex = RowList.length;
      listControllerX.removeAt(lastIndex - 1);
      listControllerY.removeAt(lastIndex - 1);
      RowList.removeLast();
      nbPoints--;
    }
    setState(() {});
  }

  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: false,
              itemCount: RowList.length,
              itemBuilder: (context, index) {
                return RowList[index];
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(0, 160, 227, 1),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color.fromRGBO(0, 160, 227, 1))),
                      )),
                  onPressed: () {
                    addNewPoint();
                  },
                  child: const Text("+", style: TextStyle(fontSize: 15)),
                )),
            const SizedBox(width: 20),
            SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(0, 160, 227, 1),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color.fromRGBO(0, 160, 227, 1))),
                      )),
                  onPressed: () {
                    envoyer();
                  },
                  child: const Text("Envoyer", style: TextStyle(fontSize: 15)),
                )),
            const SizedBox(width: 20),
            SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(220, 20, 60, 1),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color.fromRGBO(220, 20, 60, 1))),
                      )),
                  onPressed: () {
                    envoyer();
                  },
                  child: const Text("-", style: TextStyle(fontSize: 15)),
                )),
          ],
        ),
      ],
    );
  }
}
