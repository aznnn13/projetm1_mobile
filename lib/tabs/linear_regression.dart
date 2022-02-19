import 'package:flutter/material.dart';

class linear_regression extends StatelessWidget {
  const linear_regression({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ));
  }
}
