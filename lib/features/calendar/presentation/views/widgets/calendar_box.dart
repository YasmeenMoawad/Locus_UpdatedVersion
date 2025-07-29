import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/features/calendar/data/models/events_model.dart';
import 'package:locus_application/features/calendar/presentation/logic/events_bloc.dart';
import 'package:locus_application/features/calendar/presentation/views/event_view.dart';
import 'package:locus_application/generated/assets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBox extends StatelessWidget {
  CalendarBox({Key? key, required this.dates}) : super(key: key);

  List dates = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: LocusColors.primaryColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                for (DateTime d in dates) {
                  if (day.day == d.day && day.month == d.month && day.year == d.year) {
                    return Container(
                      height: 40.h, width: 40.w,
                      decoration: const BoxDecoration(
                        color: LocusColors.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: Style().popNumDays,
                        ),
                      ),
                    );
                  }
                }
                return null;
              },
            ),
            rowHeight: 50.h,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekHeight: 30.h,
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: Style().popExtra,
                titleCentered: true,
                headerMargin: EdgeInsets.only(bottom: 8.h),
                leftChevronIcon: SvgPicture.asset(Assets.imagesChevronLeft),
                rightChevronIcon: SvgPicture.asset(Assets.imagesChevronRight),
                formatButtonShowsNext: true
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: Style().popDays,
              weekendStyle: Style().popDays,
            ),
            calendarStyle: CalendarStyle(
                defaultTextStyle: Style().popNumDays,
                weekendTextStyle: Style().popNumDays,
                todayTextStyle: Style().today,
                todayDecoration: const BoxDecoration(
                    color: Colors.transparent
                ),
                tablePadding: const EdgeInsets.all(20),
                tableBorder: TableBorder(
                  borderRadius: BorderRadius.circular(15),
                )
            ),
            onDaySelected: (selectedDay, focusedDay) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EventView(selectedDay: selectedDay,)));
            },
          ),
          Divider(
            color: const Color(0xFFE5E5E5),
            thickness: 0.8,
            indent: MediaQuery.of(context).size.width / 20,
            endIndent: MediaQuery.of(context).size.width / 20,
            height: MediaQuery.of(context).size.height / 5,
          ),
        ],
      ),
    );
  }
}
