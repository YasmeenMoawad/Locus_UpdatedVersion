import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/custom_tab.dart';
import 'package:locus_application/generated/assets.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({Key? key,required this.ctrl}) : super(key: key);

  final ctrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 40.h,
        width: MediaQuery.of(context).size.width/1.3.w,
        decoration: BoxDecoration(
          color: LocusColors.primaryColor2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,
          controller: ctrl,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: LocusColors.primaryColor2.withRed(99),
          ),
          labelStyle: TextStyle(
            color: LocusColors.white,
            fontSize: 12.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelColor: LocusColors.white,
          unselectedLabelColor: LocusColors.white,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.h),
          tabs: const [
            Tab(
              child: CustomTab(label: 'Chat Bot', icon: Assets.imagesChatbotIcon),
            ),
            Tab(
              child: CustomTab(label: 'AI Image', icon: Assets.imagesAIIcon),
            ),
          ],
        ),
      ),
    );
  }
}
