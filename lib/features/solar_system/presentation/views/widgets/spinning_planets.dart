import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/core/widgets/mono_text.dart';
import 'package:locus_application/features/solar_system/data/models/each_planet_detail.dart';
import 'package:locus_application/features/solar_system/presentation/views/planet_details.dart';
import 'package:locus_application/generated/assets.dart';

class SpinningPlanets extends StatefulWidget {
  const SpinningPlanets({super.key});

  @override
  State<SpinningPlanets> createState() => _SpinningPlanetsState();
}

class _SpinningPlanetsState extends State<SpinningPlanets> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < EachPlanetDetail().planets.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
              ),
              onPressed: _goToPreviousPage,
              child: Image.asset(Assets.imagesBackward, width: 30.w,),
            ),
            MonoText(txt: EachPlanetDetail().planets.values.elementAt(_currentPage), size: 30, weight: FontWeight.normal),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
              ),
              onPressed: _goToNextPage,
              child: Image.asset(Assets.imagesForward, width: 30.w,),
            ),
          ],
        ),
        SizedBox(height: 30.h,),
        SizedBox(
          width: MediaQuery.of(context).size.width-80.w,
          height: MediaQuery.of(context).size.height/2.h,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() {
                _currentPage = index;
                print(EachPlanetDetail().planets.keys.elementAt(index));
              }),
              itemCount: EachPlanetDetail().planets.length,
            itemBuilder: (context, index) {
              return RotationTransition(
                turns: _controller,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlanetDetails(
                          planetImagePath: EachPlanetDetail().planets.keys.elementAt(index),
                          planetName: EachPlanetDetail().planets.values.elementAt(index),
                          idx: index,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                      tag: EachPlanetDetail().planets.keys.elementAt(index),
                      child: Image.asset(EachPlanetDetail().planets.keys.elementAt(index),fit: BoxFit.fitWidth,)),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
