import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';

class Dots extends StatelessWidget {
  const Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: 8.h,
      decoration: const ShapeDecoration(
        color: LocusColors.white,
        shape: OvalBorder(),
      ),
    );
  }
}
/*suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 22,width: 22,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<GenCubit>(context).loadingChange(false);
                      txtCtrl.clear();
                    },
                    child: Icon(Icons.close),
                  ),
                ),
                Container(
                  width: 33.w,
                  height: 30.h,
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: LocusColors.active,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(child: SvgPicture.asset(Assets.imagesSend),
                    onTap: () {
                      ImageGenRepo().textToImage(txtCtrl.text, context);
                      BlocProvider.of<GenCubit>(context).searchingChange(true);
                    },
                  ),
                ),
              ],
            ),*/