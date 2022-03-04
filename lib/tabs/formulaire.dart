import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class formulaire extends StatefulWidget {
  const formulaire({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _MyState();
}

class _MyState extends State<formulaire> {
  List<TextEditingController> listControllerFormulaire = [];
  TextEditingController controllerValue1 = TextEditingController();
  TextEditingController controllerValue2 = TextEditingController();
  TextEditingController controllerValue3 = TextEditingController();
  TextEditingController controllerValue4 = TextEditingController();
  TextEditingController controllerValue5 = TextEditingController();

  @override
  void initState() {
    super.initState();
    listControllerFormulaire.add(controllerValue1);
    listControllerFormulaire.add(controllerValue2);
    listControllerFormulaire.add(controllerValue3);
    listControllerFormulaire.add(controllerValue4);
    listControllerFormulaire.add(controllerValue5);
  }

  void sendFormulaire() {
    bool isEmpty = false;
    for (int i = 0; i < listControllerFormulaire.length; i++) {
      if (listControllerFormulaire[i].text.isEmpty) {
        log("Valeur vide");
        showAlertDialog(context);
        isEmpty = true;
        break;
      }
    }

    if (isEmpty == false) {
      log("ok");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valeur 1 : ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 50),
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valeur 2 : ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 50),
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valeur 3 : ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 50),
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valeur 4 : ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 50),
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valeur 5 : ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 50),
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
          height: 60,
        ),
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
