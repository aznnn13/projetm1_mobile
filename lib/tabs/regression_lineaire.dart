import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:projetm1_mobile/result/result.dart';

class RegressionLineaire extends StatefulWidget {
  const RegressionLineaire({Key? key}) : super(key: key);

  @override
  State createState() => _MyState();
}

class _MyState extends State<RegressionLineaire> {
  final int decimalRange = 5;
  int nbPoints = 1;
  List<Widget> rowList = [];
  List<TextEditingController> listControllerX = [];
  List<TextEditingController> listControllerY = [];
  bool isTextVisible = true;
  String image = "";

  void addNewPoint() {
    TextEditingController controllerX = TextEditingController();
    TextEditingController controllerY = TextEditingController();

    listControllerX.add(controllerX);
    listControllerY.add(controllerY);

    rowList.add(Column(
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
                  FilteringTextInputFormatter.allow(
                      RegExp(r'(^-?\d*\.?\d{0,5})')),
                  /*TODO: autoriser des valeurs négatives*/
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
                  FilteringTextInputFormatter.allow(
                      RegExp(r'(^-?\d*\.?\d{0,5})')),
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
    setState(() {
      isTextVisible = false;
    });
  }

  Future<void> envoyer() async {
    List<String> listX = [];
    List<String> listY = [];
    for (int i = 0; i < nbPoints - 1; i++) {
      listX.add(listControllerX[i].text.toString());
      listY.add(listControllerY[i].text.toString());
    }

    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/apiRegression'),
      // 10.0.2.2 = localhost pour android
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, List>{
        "x": listX,
        "y": listY,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      log("Server response = 200");
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to get api response.');
    }

    // Display page result
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const result()));
    setState(() {
      image = "http://127.0.0.1:5000/static/images/linear_regression.png";
    });
  }

  void removeNewPoint() {
    if (rowList.isNotEmpty) {
      int lastIndex = rowList.length;
      listControllerX.removeAt(lastIndex - 1);
      listControllerY.removeAt(lastIndex - 1);
      rowList.removeLast();
      nbPoints--;
    }
    setState(() {
      if (rowList.isEmpty) {
        isTextVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Visibility(
          child: Text("Appuyer sur + pour ajouter un nouveau point",
              style: TextStyle(color: Colors.black.withOpacity(0.5))),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: isTextVisible,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: false,
              itemCount: rowList.length,
              itemBuilder: (context, index) {
                return rowList[index];
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
            const SizedBox(width: 40),
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
            const SizedBox(width: 40),
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
                    removeNewPoint();
                  },
                  child: const Text("-", style: TextStyle(fontSize: 15)),
                )),
          ],
        ),
      ],
    );
  }
}
