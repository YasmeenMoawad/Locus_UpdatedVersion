import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key, required this.detailsType,
    required this.details, required this.idx}) : super(key: key);

  final DetailsType detailsType;
  final details,idx;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: LocusColors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Text(detailsType == DetailsType.eventInfo? '${details[1][idx]} '
              : 'Source',
            softWrap: false,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: const Color(0xFFFEAF69),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),),
          detailsType == DetailsType.eventInfo? Text('\n${details[2][idx]}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8999999761581421),
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),) :
              InkWell(
                onTap: () async {
                  await EasyLauncher.url(
                      url: "${details[4][idx]}",
                      mode: Mode.platformDefault);
                },
                    hoverColor: LocusColors.primaryColor,
                child: Text('${details[4][idx]}',
                style: TextStyle(
                  color: LocusColors.primaryColor,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  decoration: TextDecoration.underline,
                ),),)
        ],
      )
    );
  }
}
enum DetailsType {
  eventInfo,
  source,
}