import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ResultRegression extends StatelessWidget {
  const ResultRegression({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Résultat'),
        ),
        body: PhotoView(
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            imageProvider: const NetworkImage(
                "http://127.0.0.1:5000/static/images/linear_regression.png")));
  }
}
