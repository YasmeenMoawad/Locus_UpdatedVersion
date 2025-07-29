import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/questions_boxes.dart';
import 'package:locus_application/generated/assets.dart';

class IntroChatbot extends StatelessWidget {
  const IntroChatbot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3 *2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20.h,),
          MonoText(txt: 'Welcome to\nLocus Robot', size: 30.sp, weight: FontWeight.w700),
          MonoText(txt: 'Ask anything, get your answer', size: 11.sp, weight: FontWeight.w500),
          SizedBox(height: 1.h,),
          SvgPicture.asset(Assets.imagesRocket),
          MonoText(txt: 'Examples', size: 20.sp, weight: FontWeight.w500),
          QuesBoxes(childText: MonoText(txt: '“What is the influence of other planets on Earth?”',
              size: 14.sp, weight: FontWeight.w500),),
          QuesBoxes(childText: MonoText(txt: '“Is there life on other planets?”',
              size: 14.sp, weight: FontWeight.w500),),
          QuesBoxes(childText: MonoText(txt: '“Generate to me photo about constellation.”',
              size: 14.sp, weight: FontWeight.w500),),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
