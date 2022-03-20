import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/route.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';
import 'package:oggetto_afisha_front/presentation/screens/category_screen.dart';
import 'package:oggetto_afisha_front/presentation/widgets/category_card.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              // TODO: сделать прокрутку с категориями
              children: List.generate(
                50,
                (index) => CategoryCard(
                  asset: 'assets/icons/face.svg',
                  title: 'интерес$index',
                  onTap: () {
                    Navigator.of(context).push(
                      route(const CategoryScreen()),
                    );
                  },
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.15,
            widthFactor: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: mainBackgroundColor,
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text('Интересы', style: bigWhiteBold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
