part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

abstract class EventsActionState extends EventsState {}

class EventsInitial extends EventsState {}

class EventsFetchingLoadingState extends EventsState {}

class EventsFetchingErrorState extends EventsState {}

class EventsFetchingSuccessfulState extends EventsState {
  final List<EventsModel> events;
  EventsFetchingSuccessfulState({
    required this.events,
  });
}
