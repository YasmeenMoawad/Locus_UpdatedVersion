import 'package:flutter/material.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/core/widgets/mono_text.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImgBG(shadowColor: LocusColors.shadowOfBG),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 660,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xff858585).withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      MonoText(txt: 'Get Started', size: 42, weight: FontWeight.w300),
                      TextFormField(),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
