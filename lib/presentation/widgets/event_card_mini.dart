import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';

class EventCardMini extends StatelessWidget {
  final String category;
  final String eventText;
  final String dateTime;
  final VoidCallback onTap;
  const EventCardMini({
    Key? key,
    required this.category,
    required this.eventText,
    required this.dateTime,
    required this.onTap,
  }) : super(key: key);

  String _abbreviation() {
    if (eventText.length > 25) {
      return eventText.substring(0, 20) + '...';
    }
    return eventText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/elon.jpg'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  dateTime,
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
            Text(category, style: eventCardMiniCategoryText),
            Text(_abbreviation(), style: eventCardMininDescriptionText),
          ],
        ),
      ),
    );
  }
}
