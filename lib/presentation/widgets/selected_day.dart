import 'package:flutter/material.dart';

class SelectedDay extends StatelessWidget {
  final String date;
  const SelectedDay({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3E3E3E),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: InkWell(
          onTap: () {},
          child: Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
