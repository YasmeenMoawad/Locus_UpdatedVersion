import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/chat_bar.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/chat_body.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/intro_chatbot.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/questions_boxes.dart';
import 'package:locus_application/generated/assets.dart';

class ChatbotView extends StatefulWidget {
   ChatbotView({Key? key}) : super(key: key);

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  bool showWidget = false;

  @override
  Widget build(BuildContext context) {
    return showWidget? Column(
      children: [
        const IntroChatbot(),
        //const ChatBar(),
        ElevatedButton(
          onPressed: (){
            setState(() {
              showWidget = !showWidget;
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 40.h),
            backgroundColor: LocusColors.white.withOpacity(0.07999999821186066),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: LocusColors.active, width: 1,)),
          ),
          child: MonoText(txt: 'Start', size: 20.sp, weight: FontWeight.w500),
        ),
        SizedBox(height: 1.h,),
      ],
    ): ChatBody();
  }
}
