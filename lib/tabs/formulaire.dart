import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:projetm1_mobile/result/formulaire_result.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _MyState();
}

class _MyState extends State<Formulaire> {
  List<TextEditingController> listControllerFormulaire = [];
  TextEditingController controllerValue1 = TextEditingController();
  TextEditingController controllerValue2 = TextEditingController();
  TextEditingController controllerValue3 = TextEditingController();
  TextEditingController controllerValue4 = TextEditingController();
  TextEditingController controllerValue5 = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    listControllerFormulaire.add(controllerValue1);
    listControllerFormulaire.add(controllerValue2);
    listControllerFormulaire.add(controllerValue3);
    listControllerFormulaire.add(controllerValue4);
    listControllerFormulaire.add(controllerValue5);
  }

  Future<void> sendFormulaire() async {
    bool isEmpty = false;

    // empty value check
    for (int i = 0; i < listControllerFormulaire.length; i++) {
      if (listControllerFormulaire[i].text.isEmpty) {
        log("Valeur vide");
        showAlertDialog(context);
        isEmpty = true;
        break;
      }
    }

    if (isEmpty == false) {
      //
      List<String> listParameters = [];
      for (int i = 0; i < listControllerFormulaire.length; i++) {
        listParameters.add(listControllerFormulaire[i].text.toString());
      }

      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/apiFormulaire'),
        // android : 10.0.2.2:port
        // ios & web : 127.0.0.1:5000
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "saveData": isChecked.toString(),
          "parameters": listParameters,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultFormulaire(
                      result: response.body.toString(),
                    )));
      } else {
        throw Exception('Failed to get api response.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Breslow : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                width: 115,
                child: TextField(
                  controller: controllerValue1,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^-?\d*\.?\d{0,5})')),
                  ],
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valeur',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Ulceration : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                width: 115,
                child: TextField(
                  controller: controllerValue2,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^-?\d*\.?\d{0,5})')),
                  ],
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valeur',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Mitoses : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                width: 115,
                child: TextField(
                  controller: controllerValue3,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^-?\d*\.?\d{0,5})')),
                  ],
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valeur',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("AJCC_corr : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                width: 115,
                child: TextField(
                  controller: controllerValue4,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^-?\d*\.?\d{0,5})')),
                  ],
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valeur',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("VCD_retenue : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                width: 115,
                child: TextField(
                  controller: controllerValue5,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^-?\d*\.?\d{0,5})')),
                  ],
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valeur',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              const SizedBox(width: 5),
              const Text("Sauvegarder mes données"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      sendFormulaire();
                    },
                    child: const Text("Envoyer", style: TextStyle(fontSize: 15)),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  CupertinoAlertDialog alert = CupertinoAlertDialog(
    title: const Text("Erreur"),
    content: const Text("Veuillez remplir tous les champs \n"
        "ou mettre -1 aux valeurs non utilisées"),
    actions: <Widget>[
      CupertinoDialogAction(
        isDefaultAction: true,
        child: okButton,
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
