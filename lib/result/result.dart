import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  State createState() => _MyState();
}

class _MyState extends State<result> {
  @override
  void initState() {
    super.initState();
    //Reset the image cache
    imageCache?.clear();
  }

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
