import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';

class EventAppBar extends StatelessWidget {
  final String title;
  const EventAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: whiteBold,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              customBorder: const CircleBorder(),
              child: const Icon(
                Icons.close_outlined,
                color: Color(0xFF6F6B6A),
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
