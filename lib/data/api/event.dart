import 'dart:convert';

class ApiEvent {
  final int id;
  final String imgUrl;
  final String name;
  final String startDate;
  final String endDate;
  final String period;
  ApiEvent({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.period,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'period': period,
    };
  }

  factory ApiEvent.fromMap(Map<String, dynamic> map) {
    return ApiEvent(
      id: map['id'].toInt(),
      imgUrl: map['imgUrl'],
      name: map['name'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      period: map['period'],
    );
  }
}
