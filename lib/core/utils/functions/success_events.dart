import 'package:flutter/material.dart';
import 'package:locus_application/features/calendar/presentation/logic/events_bloc.dart';

class SuccessEvents{
  Iterable<DateTime> getDate = {}; List<DateTime> dates = [];
  Iterable<String> getName = {}; List<String> name = [];
  Iterable<String> getDetails = {}; List<String> details = [];
  Iterable<String> getImgs = {}; List<String> imgs = [];
  Iterable<String> getSource = {}; List<String> source = [];
  List<List<dynamic>> getEvents(EventsFetchingSuccessfulState successState){

  for (int idx = 0; idx < successState.events.length; idx++) {
  getDate = successState.events[idx].events.map((dt) => dt.from);
  getName = successState.events[idx].events.map((nm) => nm.name);
  getDetails = successState.events[idx].events.map((de) => de.details);
  getImgs = successState.events[idx].events.map((mg) => mg.image);
  getSource = successState.events[idx].events.map((sc) => sc.source);

  //final datesConverted = date.map((dt) => (DateTime.parse(dt.toString())));
  dates.add(getDate.first);
  name.add(getName.first);
  details.add(getDetails.first);
  imgs.add(getImgs.first);
  source.add(getSource.first);
  }
  return [dates,name,details,imgs,source];
  }
}