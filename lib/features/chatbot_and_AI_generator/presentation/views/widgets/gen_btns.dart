import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/data/repositories/image_gen_repo.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/locus_msgs.dart';

class GenBtns extends StatelessWidget {
  const GenBtns({Key? key, required this.txtCtrl}) : super(key: key);

  final txtCtrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            ImageGenRepo().textToImage(txtCtrl.text, context);
            BlocProvider.of<GenCubit>(context).searchingChange(true);
          },
          child: Container(
              alignment: Alignment.center,
              height: 38.h,
              width: 140.w,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        LocusColors.primaryColor,
                        Colors.purple
                      ]),
                  color: LocusColors.primaryColor,
                  borderRadius:
                  BorderRadius.all(Radius.circular(12.0))),
              child: BlocProvider.of<GenCubit>(context).isSearching == false
                  ? Text('Generate', style: Style().popExtra,)
                  : const LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: [LocusColors.white],
                strokeWidth: 1.7,
                backgroundColor: Colors.transparent,
                pause: false,
              ),),
        ),
        SizedBox(width: 5.w,),
        GestureDetector(
          onTap: () {
            BlocProvider.of<GenCubit>(context).loadingChange(false);
            txtCtrl.clear();
          },
          child: Container(
            alignment: Alignment.center,
            height: 38.h,
            width: 140.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.teal, LocusColors.primaryColor]),
                color: LocusColors.primaryColor,
                borderRadius:
                BorderRadius.all(Radius.circular(12.0))),
            child: Text('Clear', style: Style().popExtra,),
          ),
        ),
      ],
    );
  }
}
