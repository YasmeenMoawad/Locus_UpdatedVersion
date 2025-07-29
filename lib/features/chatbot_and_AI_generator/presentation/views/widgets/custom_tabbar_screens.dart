import 'package:flutter/material.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/AI_generator_view.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/chatbot_view.dart';

class CustomTabbarScrrens extends StatelessWidget {
  const CustomTabbarScrrens({Key? key, required this.ctrl}) : super(key: key);

  final ctrl;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: ctrl,
        children:  [
          ChatbotView(),
          AIGeneratorView(),
        ],
      ),
    );
  }
}
