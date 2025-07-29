import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/vr/presentation/views/widgets/level.dart';
import 'package:locus_application/generated/assets.dart';

class VrGame extends StatelessWidget {
  const VrGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImgBG(shadowColor: LocusColors.shadowOfBG),
          Padding(
            padding: EdgeInsets.only(bottom: 28.h, top: 50.h, left: 20.w, right: 20.w),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Level(numLevel: 'Level One', imgLevel: Assets.imagesLevel1Bg),
                Level(numLevel: 'Level Two', imgLevel: Assets.imagesLevel2Bg),
                Level(numLevel: 'Level Three', imgLevel: Assets.imagesLevel3Bg),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
