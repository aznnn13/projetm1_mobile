import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:projetm1_mobile/const.dart';

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
            imageProvider: NetworkImage(
                androidDevIp + "static/images/linear_regression.png")));
  }
}
