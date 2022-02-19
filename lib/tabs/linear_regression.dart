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
        const Point(),
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
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                textColor: const Color.fromRGBO(0, 160, 227, 1),
                child: const Text("Ajouter un point",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            const SizedBox(width: 40),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                        color: Color.fromRGBO(220, 20, 60, 1))),
                onPressed: () {},
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                textColor: const Color.fromRGBO(220, 20, 60, 1),
                child: const Text("Supprimer le dernier point",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class Point extends StatelessWidget {
  const Point({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
