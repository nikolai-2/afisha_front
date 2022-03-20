class EventsList {
  final List<Event> todayEvents;
  final List<Event> mostPopularEvents;
  final List<Event> interestedEvents;
  EventsList({
    required this.todayEvents,
    required this.mostPopularEvents,
    required this.interestedEvents,
  });
}

class Event {
  final int id;
  final String imgUrl;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String period;
  Event({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.period,
  });
}
