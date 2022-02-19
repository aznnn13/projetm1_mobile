import 'package:flutter/material.dart';

class formulaire extends StatelessWidget {
  const formulaire({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ));
  }
}