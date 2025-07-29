import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/calendar/presentation/views/widgets/custom_back_button.dart';
import 'package:locus_application/features/solar_system/data/models/each_planet_detail.dart';


class PlanetDetails extends StatelessWidget {
  const PlanetDetails({
    required this.planetImagePath,
    required this.planetName,
    required this.idx,
    super.key,
  });
  final String planetImagePath;
  final String planetName;
  final idx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImgBG(shadowColor: LocusColors.shadowOfBG),
          CustomizedBackButton(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: planetImagePath,
                    child: Image.asset(
                      planetImagePath,
                      width: 120.w,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  MonoText(txt: '$planetName Details', size: 20.sp, weight: FontWeight.w100),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        //height: MediaQuery.of(context).size.height /3*2 -10.h,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: LocusColors.primaryColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(EachPlanetDetail().planetDetails[idx],
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            textScaler: TextScaler.linear(1.1),
                            style: Style().popNumDays ),
                      ),
                    ),
                  )],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
