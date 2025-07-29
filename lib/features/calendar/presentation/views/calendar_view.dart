import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/utils/functions/success_events.dart';
import 'package:locus_application/core/widgets/appbar.dart';
import 'package:locus_application/core/widgets/custom_drawer.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/calendar/presentation/logic/events_bloc.dart';
import 'package:locus_application/features/calendar/presentation/views/widgets/calendar_box.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final EventsBloc eventsBloc = EventsBloc();
  @override
  void initState() {
    eventsBloc.add(EventsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Stack(
      children: [
        const ImgBG(shadowColor: LocusColors.shadowOfBG),
        Scaffold(
          key: scaffoldKey,
            backgroundColor: Colors.transparent,
          appBar: CustomizedAppBar(sKey: scaffoldKey,
              isNotification: false),
          drawer: const CustomizedDrawer(),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              BlocBuilder<EventsBloc, EventsState>(
                  bloc: eventsBloc,
                  buildWhen: (previous, current) => current is! EventsActionState,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case EventsFetchingLoadingState:
                        return  Center(
                          child: CalendarBox(dates: [],),);
                      case EventsFetchingSuccessfulState:
                        final successState = state as EventsFetchingSuccessfulState;
                        List success = SuccessEvents().getEvents(successState);
                        return CalendarBox(dates: success[0],);
                        default:
                        return const SizedBox();
                    }
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
