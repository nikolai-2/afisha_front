import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/custom_behavior.dart';
import 'package:oggetto_afisha_front/presentation/screens/main_screen.dart';
import 'package:oggetto_afisha_front/presentation/widgets/navigation_bar.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oggetto Afisha',
      theme: ThemeData(
        scaffoldBackgroundColor: mainBackgroundColor,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomBehavior(),
          child: child!,
        );
      },
      home: const MainScreen(),
    );
  }
}
