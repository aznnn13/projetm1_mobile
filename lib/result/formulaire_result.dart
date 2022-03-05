import 'package:flutter/material.dart';

class ResultFormulaire extends StatelessWidget {
  final String result;

  const ResultFormulaire({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Résultat'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                Text(
                  "Valeur max : " + result,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20),
                )
              ],
            )
          ],
        ));
  }
}
