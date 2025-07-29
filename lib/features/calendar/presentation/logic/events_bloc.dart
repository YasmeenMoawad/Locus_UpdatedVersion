import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:locus_application/features/calendar/data/models/events_model.dart';
import 'package:locus_application/features/calendar/data/repositories/events_repo.dart';

import 'package:meta/meta.dart';
part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<EventsInitialFetchEvent>(eventsInitialFetchEvent);
  }

  FutureOr<void> eventsInitialFetchEvent(
      EventsInitialFetchEvent event, Emitter<EventsState> emit) async {
    emit(EventsFetchingLoadingState());
    List<EventsModel> events = await EventsRepo.fetchEvents();

    emit(EventsFetchingSuccessfulState(events: events));
  }
}