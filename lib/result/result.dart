import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class result extends StatelessWidget {
  const result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Résultat'),
        ),
        body: PhotoView(
            imageProvider: const NetworkImage(
                "http://127.0.0.1:5000/static/images/linear_regression.png")));
  }
}
