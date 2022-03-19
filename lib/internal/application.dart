import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/custom_behavior.dart';
import 'package:oggetto_afisha_front/presentation/screens/event_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oggetto Afisha',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomBehavior(),
          child: child!,
        );
      },
      home: const EventScreen(),
    );
  }
}
