import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/core/widgets/mono_text.dart';

class NullImgBox extends StatelessWidget {
  const NullImgBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      height: 320.h,
      width: 320.w,
      decoration: BoxDecoration(
          color: LocusColors.primaryColor2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            12.0,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Text('No Image has been generated yet.', style: Style().popNumDays,),
        ],
      ),
    );
  }
}
