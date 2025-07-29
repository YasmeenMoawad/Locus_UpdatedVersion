import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/data/repositories/image_gen_repo.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/chat_bar.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/gen_btns.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/image_box.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/locus_msgs.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/null_img_box.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/sender_msgs.dart';

class AIGeneratorView extends StatefulWidget {
  AIGeneratorView({Key? key}) : super(key: key);

  @override
  State<AIGeneratorView> createState() => _AIGeneratorViewState();
}

class _AIGeneratorViewState extends State<AIGeneratorView> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenCubit(),
      child: BlocBuilder<GenCubit, GenState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 180.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocProvider.of<GenCubit>(context).isLoading
                        == true
                        ? const ImageBox(): const NullImgBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChatBar(txtCtrl: _textController),
                        SizedBox(height: 8.h,),
                        GenBtns(txtCtrl: _textController),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
      ),);
  }
}

