import 'dart:async';
import 'package:flutter/material.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/onboarding/presentation/views/onboarding.dart';
import 'package:locus_application/features/splash/presentation/views/widgets/text.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay(){
    _timer= Timer(const Duration(seconds:5), _goNext);
  }

  _goNext(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),);  }

  @override
  void initState(){
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ImgBG(shadowColor: Colors.transparent),
          AppNameTextWidget(),
        ],
      ),
    );
  }
  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
}
