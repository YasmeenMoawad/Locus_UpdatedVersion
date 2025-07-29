import 'dart:convert';

EventsModel eventsFromJson(String str) => EventsModel.fromJson(json.decode(str));

//String eventsToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  final List<Event> events;

  EventsModel({
    required this.events,
  });

  factory EventsModel.fromJson(Map<String,dynamic> json) {
    var list = [json] ;

      return EventsModel(
        events: List<Event>.from(list.map((x) => Event.fromJson(x))).toList(),
      );
  }
}

class Event {
  int id;
  String name;
  DateTime from;
  DateTime to;
  String image;
  int requiresBinoculars;
  String details;
  String source;
  DateTime createdAt;
  DateTime updatedAt;

  Event({
    required this.id,
    required this.name,
    required this.from,
    required this.to,
    required this.image,
    required this.requiresBinoculars,
    required this.details,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    name: json["name"],
    from: DateTime.parse(json["from"]),
    to: DateTime.parse(json["to"]),
    image: json["image"],
    requiresBinoculars: json["requiresBinoculars"],
    details: json["details"],
    source: json["source"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "from": from.toIso8601String(),
    "to": to.toIso8601String(),
    "image": image,
    "requiresBinoculars": requiresBinoculars,
    "details": details,
    "source": source,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
