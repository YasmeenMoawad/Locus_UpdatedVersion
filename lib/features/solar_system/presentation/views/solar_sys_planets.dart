import 'package:flutter/material.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/solar_system/presentation/views/widgets/customized_particles.dart';
import 'package:locus_application/features/solar_system/presentation/views/widgets/spinning_planets.dart';
import 'package:particles_flutter/particles_engine.dart';
class SolarSysPlanetsView extends StatelessWidget {
  SolarSysPlanetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImgBG(shadowColor: LocusColors.shadowOfBG),
          Stack(
            children: [
              Particles(
                awayRadius: 150,
                particles: CustomizedParticles().createParticles(),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                onTapAnimation: true,
                awayAnimationDuration: const Duration(milliseconds: 8000),
                awayAnimationCurve: Curves.linear,
                enableHover: true,
                hoverRadius: 20,
                connectDots: false,
              ),
              Center(
                  child: SpinningPlanets(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
