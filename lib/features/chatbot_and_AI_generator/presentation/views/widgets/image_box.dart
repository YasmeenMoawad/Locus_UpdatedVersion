import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/data/repositories/image_gen_repo.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 320.h,
      width: 320.w,
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(12.0,)),
      child: Image.memory(BlocProvider.of<GenCubit>(context).img!),
    );
  }
}
