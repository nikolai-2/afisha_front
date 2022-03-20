import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/presentation/screens/home_screen.dart';
import 'package:oggetto_afisha_front/presentation/widgets/event_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  maxHeight: 450,
                  minHeight: 450,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
