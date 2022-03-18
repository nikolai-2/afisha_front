import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oggetto Afisha',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: null,
    );
  }
}
