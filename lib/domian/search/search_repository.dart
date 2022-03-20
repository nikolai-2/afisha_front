import 'package:oggetto_afisha_front/domian/events/events_entites.dart';

abstract class SearchRepository {
  Future<List<Event>> search(String text);
}
