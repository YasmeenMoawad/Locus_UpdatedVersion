import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/data/repositories/image_gen_repo.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/locus_msgs.dart';
import 'package:locus_application/generated/assets.dart';

class ChatBar extends StatefulWidget {
   ChatBar({Key? key, required this.txtCtrl}) : super(key: key);

   final txtCtrl;

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
   @override
  Widget build(BuildContext context) {
    return TextField(
                //maxLines: 2,
                style: TextStyle(color: LocusColors.lightGrey, fontFamily: 'Poppins', fontSize: 12.sp),
                controller: widget.txtCtrl,
                cursorColor: LocusColors.active,
                decoration: InputDecoration(
                  hintText: ' Type your imaginary scene ..',
                  hintStyle: TextStyle(color: LocusColors.lightGrey, fontFamily: 'Poppins', fontSize: 12.sp),
                  fillColor: LocusColors.primaryColor2.withOpacity(0.2),
                  filled: true,
                  border: InputBorder.none,
                  //contentPadding: const EdgeInsets.all(8),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                ),
              );
  }
}
