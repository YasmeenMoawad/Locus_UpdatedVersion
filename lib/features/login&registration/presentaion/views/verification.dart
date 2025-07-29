import 'package:flutter/material.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/img_bg.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ImgBG(shadowColor: LocusColors.shadowOfBG),
        ],
      ),
    );
  }
}
