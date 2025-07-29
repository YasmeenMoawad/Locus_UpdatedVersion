import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:locus_application/features/calendar/data/models/events_model.dart';

class EventsRepo {
  static Future<List<EventsModel>> fetchEvents(//String date
   ) async {
    var dio = Dio();
    List<EventsModel> events = [];
    try {
      var response = await dio.get('https://locus.hostek.xyz/public/api/events');

      final dynamic responseData = response.data;

      if (responseData != null && responseData is Map<String, dynamic>) {
        final List<dynamic>? eventList = responseData['events'];
        //print(eventList);
        if (eventList != null) {
          for (int i = 0; i < eventList.length; i++) {
            if (eventList[i] != null && eventList[i] is Map<String, dynamic>) {
              EventsModel event = EventsModel.fromJson(eventList[i]);
              events.add(event);
            }
          }
        }
      }
      //print(events);
      return events;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}