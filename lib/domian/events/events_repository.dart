import 'package:oggetto_afisha_front/domian/events/events_entites.dart';

abstract class EventsRepository {
  Future<EventsList> getEventList(DateTime date);
  Future<Event> getEventByID(Event event);
}
