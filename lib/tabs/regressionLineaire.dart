import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

  Future<void> envoyer() async {
    for (int i = 0; i < listControllerX.length; i++) {
      log("Point " +
          (i + 1).toString() +
          ": X =" +
          listControllerX[i].text.toString() +
          ", Y = " +
          listControllerY[i].text.toString());
    }

    log(await http.read(Uri.parse('http://127.0.0.1:5000/apiRegression')));

  }

  void removeNewPoint() {
    if (rowList.isNotEmpty) {
      int lastIndex = rowList.length;
      listControllerX.removeAt(lastIndex - 1);
      listControllerY.removeAt(lastIndex - 1);
      rowList.removeLast();
      nbPoints--;
    }
    setState(() {});
  }

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