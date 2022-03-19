import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';

class Calendar extends StatefulWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;
  const Calendar({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _startDate = DateTime.now();
  Color _textColor = Colors.white;
  late DateTime date;

  String _weekdayName() {
    _isHoliday();
    switch (date.weekday) {
      case 1:
        return 'Пн';
      case 2:
        return 'Вт';
      case 3:
        return 'Ср';
      case 4:
        return 'Чт';
      case 5:
        return 'Пт';
      case 6:
        return 'Сб';
      case 7:
        return 'Вс';
      default:
        throw Exception('weekday must be > 0 && < 8');
    }
  }

  void _isHoliday() {
    if (date.weekday > 5) {
      _textColor = const Color(0xFFFF5823);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteListView.builder(
      itemBuilder: (context, i) {
        final date = _startDate.add(Duration(days: i));
        final bool isCurrentDate = date.day == widget.selectedDate.day &&
            date.month == widget.selectedDate.month &&
            date.year == widget.selectedDate.year;
        return InkWell(
          onTap: () {
            widget.onDateSelected(date);
          },
          borderRadius: BorderRadius.circular(5),
          child: Ink(
            width: 40,
            height: 45,
            color: categoryCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _weekdayName(),
                  style: TextStyle(
                    fontSize: 10,
                    color: _textColor,
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
