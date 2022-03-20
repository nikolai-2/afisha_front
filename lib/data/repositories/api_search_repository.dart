import 'dart:convert';

import 'package:oggetto_afisha_front/data/api/event.dart';
import 'package:oggetto_afisha_front/data/api/service.dart';
import 'package:oggetto_afisha_front/domian/events/events_entites.dart';
import 'package:oggetto_afisha_front/domian/search/search_repository.dart';

class ApiSearchRepository extends SearchRepository {
  @override
  Future<List<Event>> search(String text) async {
    final List<Event> _res = [];

    final _response = await getDataFromAPI('/search', '?querry=$text');

    List<Map<String, dynamic>> _decodeJson = jsonDecode(_response.body);

    for (final _item in _decodeJson) {
      final _event = ApiEvent.fromMap(_item);
      _res.add(Event(
        id: _event.id,
        imgUrl: _event.imgUrl,
        name: _event.name,
        startDate: DateTime.parse(_event.startDate),
        endDate: DateTime.parse(_event.endDate),
        period: _event.period,
      ));
    }

    return _res;
  }
}
