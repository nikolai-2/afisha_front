import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/presentation/custom_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void _onTapped(int index) {
    _selectedIndex = index;
    setState(() {});
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        // TODO: внести список готовых экранов
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
        ],
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
        currentIndex: _selectedIndex,
        iconSize: 40,
        backgroundColor: mainBackgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: iconGreyColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTapped,
      ),
    );
  }
}
