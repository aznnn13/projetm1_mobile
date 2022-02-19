import 'package:flutter/material.dart';

class linear_regression extends StatelessWidget {
  const linear_regression({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("Valeur 1 : "),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'X',
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: TextField(
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
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Ajouter un point'),
            ),
          ],

        ),
      ],
    ));
  }
}
