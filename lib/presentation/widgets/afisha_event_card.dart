import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';

class AfishaEventCard extends StatelessWidget {
  final String text;
  final String category;
  final String date;
  final String imageSrc;
  final VoidCallback onTap;

  const AfishaEventCard({
    Key? key,
    required this.text,
    required this.category,
    required this.date,
    required this.onTap,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageSrc),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: Color(0xFFD9D4D4),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(text.toUpperCase(), style: bigWhiteBold),
              Text(date, style: const TextStyle(color: Color(0xFFEFEFEF))),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
