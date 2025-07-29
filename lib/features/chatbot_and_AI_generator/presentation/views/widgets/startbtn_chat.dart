import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';

class StartBtn extends StatelessWidget {
  const StartBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: LocusColors.white.withOpacity(0.07999999821186066),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: LocusColors.active, width: 1,)),
        ),
        child: MonoText(txt: 'Start', size: 20.sp, weight: FontWeight.w500),
    );
  }
}
