import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/route.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';
import 'package:oggetto_afisha_front/main.dart';
import 'package:oggetto_afisha_front/presentation/custom_icons.dart';
import 'package:oggetto_afisha_front/presentation/screens/category_list_screen.dart';
import 'package:oggetto_afisha_front/presentation/screens/event_screen.dart';
import 'package:oggetto_afisha_front/presentation/widgets/afisha_event_card.dart';
import 'package:oggetto_afisha_front/presentation/widgets/calendar.dart';
import 'package:oggetto_afisha_front/presentation/widgets/event_card.dart';
import 'package:oggetto_afisha_front/presentation/widgets/event_card_mini.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

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

  late final List<Widget> _pages = [
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                maxHeight: 50,
                minHeight: 50,
                child: Container(
                  color: mainBackgroundColor,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: categoryCardColor,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.search_rounded,
                              color: Color(0xFF868686),
                            ),
                            hintText: 'Интерес, название или хештег',
                            fillColor: Color(0xFF868686),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF868686),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 65,
                maxHeight: 65,
                child: Container(
                  color: mainBackgroundColor,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 45,
                            child: LayoutBuilder(
                              builder: (context, constraints) => Calendar(
                                width: constraints.maxWidth,
                                selectedDate: selectedDate,
                                onDateSelected: (date) {
                                  setState(() => selectedDate = date);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 55,
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Сегодня', style: headerWhiteText),
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 185,
              delegate: SliverChildListDelegate(
                [
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => EventCardMini(
                      category: 'category',
                      eventText: 'eventText',
                      dateTime: '16:00',
                      onTap: () {
                        Navigator.of(context).push(route(const EventScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Самое популярное',
                      style: headerWhiteText,
                    ),
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 250,
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AfishaEventCard(
                      imageSrc:
                          'https://cdn.pixabay.com/photo/2018/07/14/11/33/earth-3537401_960_720.jpg',
                      category: 'Встреча',
                      date: '21 марта в 16:00',
                      text: 'Поход в бар',
                      onTap: () {
                        Navigator.of(context).push(route(const EventScreen()));
                      },
                    ),
                  );
                },
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ваши интересы',
                      style: headerWhiteText,
                    ),
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 300,
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: EventCard(
                      onTap: () {
                        Navigator.of(context).push(route(const EventScreen()));
                      },
                      text: 'Встреча в баре',
                      category: 'Пиво',
                      imageSrc:
                          'https://cdn.pixabay.com/photo/2018/07/14/11/33/earth-3537401_960_720.jpg',
                      date: '21 марта в 16:00',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    const CategoryListScreen(),
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
            icon: Icon(CustomIcons.interests),
            label: 'Интересы',
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
