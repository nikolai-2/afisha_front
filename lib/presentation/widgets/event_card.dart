import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String text;
  final String category;
  final String data;
  final String imageSrc;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.text,
    required this.category,
    required this.data,
    required this.onTap,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                child: Text(
                  data,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    background: Paint()
                      ..strokeWidth = 14.5
                      ..color = const Color(0x70000000)
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFA5A5A5),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
