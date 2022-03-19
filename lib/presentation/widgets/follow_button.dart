import 'package:flutter/material.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';

class FollowButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const FollowButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF39363D),
        borderRadius: BorderRadius.circular(16.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 25,
        ),
        child: InkWell(
          onTap: onTap,
          child: Text(
            text.toUpperCase(),
            style: whiteBold,
          ),
        ),
      ),
    );
  }
}
