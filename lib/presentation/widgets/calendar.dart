import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';

class Calendar extends StatefulWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;
  final double width;
  const Calendar({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.width,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime startDate = DateTime.now();
  Color _textColor = Colors.white;
  DateTime? date;

  String _weekdayName() {
    _isHoliday();
    switch (date!.weekday) {
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
    if (date!.weekday > 5) {
      _textColor = const Color(0xFFFF5823);
      return;
    }
    _textColor = Colors.white;
  }

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now().add(Duration(days: -DateTime.now().weekday + 1));
  }

  Widget _isCurrent(bool isCurrentDate) {
    return isCurrentDate
        ? Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF3E3E3E),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Ink(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: categoryCardColor,
                ),
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
                      '${date!.day}',
                      style: TextStyle(
                        color: _textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: categoryCardColor,
            ),
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
                  '${date!.day}',
                  style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: widget.width / 6.9,
      itemBuilder: (context, i) {
        date = startDate.add(Duration(days: i));
        final isCurrentDate = date!.day == widget.selectedDate.day &&
            date!.month == widget.selectedDate.month &&
            date!.year == widget.selectedDate.year;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Material(
            color: mainBackgroundColor,
            child: InkWell(
              onTap: () {
                widget.onDateSelected(date!);
              },
              borderRadius: BorderRadius.circular(5),
              child: _isCurrent(isCurrentDate),
            ),
          ),
        );
      },
    );
  }
}
