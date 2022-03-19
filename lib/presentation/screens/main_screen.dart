import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';
import 'package:oggetto_afisha_front/presentation/custom_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.afisha),
            label: 'Афиша',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.interests),
            label: 'Интересы',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.profile),
            label: 'Профиль',
          ),
        ],
        iconSize: 40,
        backgroundColor: mainBackgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: iconGreyColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
