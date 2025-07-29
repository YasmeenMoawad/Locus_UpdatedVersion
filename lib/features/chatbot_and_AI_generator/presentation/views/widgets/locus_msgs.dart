import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';

class LocusMsgs extends StatelessWidget {
  const LocusMsgs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return BlocProvider.of<GenCubit>(context).isSearching == false ?
      //  SizedBox(height: 30.h, width: 56.w,):
    return Container(
      width: 56.w,
      height: 30.h,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: LocusColors.white.withOpacity(0.20000000298023224),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.w, height: 30.h,
            child: const LoadingIndicator(
              indicatorType: Indicator.ballPulseSync,
              colors: [LocusColors.white],
              strokeWidth: 0.8,
              backgroundColor: Colors.transparent,
              pause: false,
            ),
          ),
        ],
      ),
    );
  }
}
