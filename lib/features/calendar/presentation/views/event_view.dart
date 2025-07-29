import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/utils/functions/success_events.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/calendar/presentation/logic/events_bloc.dart';
import 'package:locus_application/features/calendar/presentation/views/widgets/custom_back_button.dart';
import 'package:locus_application/features/calendar/presentation/views/widgets/event_details.dart';
import 'package:locus_application/generated/assets.dart';

class EventView extends StatefulWidget {
  EventView({Key? key, required this.selectedDay}) : super(key: key);

  final selectedDay;

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  final EventsBloc eventsBloc = EventsBloc();
  @override
  void initState() {
    eventsBloc.add(EventsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImgBG(shadowColor: LocusColors.shadowOfBG),
          BlocBuilder<EventsBloc, EventsState>(
              bloc: eventsBloc,
              buildWhen: (previous, current) => current is! EventsActionState,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case EventsFetchingLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(color: LocusColors.primaryColor),);
                  case EventsFetchingSuccessfulState:
                    final successState = state as EventsFetchingSuccessfulState;
                    List success = SuccessEvents().getEvents(successState);
                    for(int idx = 0; idx < success[0].length ; idx++){
                      if (widget.selectedDay.day == success[0][idx].day && widget.selectedDay.month == success[0][idx].month
                          && widget.selectedDay.year == success[0][idx].year){
                        int currentEventIdx = idx;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                      child: Image.network(success[3][currentEventIdx]),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.zero, bottom: Radius.circular(30.sp),
                                    ),
                                  ),
                                  const CustomizedBackButton(),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 14.w),
                                child: Column(
                                  children: [
                                    EventDetails(detailsType: DetailsType.eventInfo,details: success,idx: currentEventIdx),
                                    SizedBox(height: 20.h,),
                                    EventDetails(detailsType: DetailsType.source, details: success,idx: currentEventIdx),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    }
                    return const Stack(
                      children: [
                         Center(child: Text("There's no event on this day",
                          style: TextStyle(color: Colors.white),
                        )),
                        CustomizedBackButton(),
                      ],
                    );
                  default:
                    return const SizedBox();
                }
              }),

        ],
      ),
    );
  }
}
