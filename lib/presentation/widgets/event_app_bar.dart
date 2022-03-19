import 'package:flutter/material.dart';

class EventAppBar extends StatelessWidget {
  const EventAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          const Text(
            'НАСТОЛЬНЫЕ ИГРЫ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
