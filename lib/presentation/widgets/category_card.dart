import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';

class CategoryCard extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.asset,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: categoryCardColor,
        ),
        padding: const EdgeInsets.only(left: 10, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(asset),
            const SizedBox(height: 10),
            Text(title, style: optionStyle),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
