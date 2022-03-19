import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/presentation/custom_icons.dart';
import 'package:oggetto_afisha_front/presentation/screens/category_screen.dart';
import 'package:oggetto_afisha_front/presentation/widgets/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = [
    Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          LayoutBuilder(
            builder: (context, constraints) => Calendar(
              selectedDate: selectedDate,
              onDateSelected: (date) {
                setState(() {});
              },
            ),
          ),
          Spacer(),
        ],
      ),
    ), // афиша
    Container(color: Colors.green), // поиск
    const CategoryScreen(), // интересы
    Container(color: Colors.blue), // профиль
  ];

  void _onTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return _pages[_selectedIndex];
        },
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
