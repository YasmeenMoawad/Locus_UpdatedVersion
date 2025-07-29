import 'package:flutter/material.dart';
import 'package:locus_application/features/calendar/presentation/views/calendar_view.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/chatbot_AI_view_body.dart';
import 'package:locus_application/features/explore_news/presentation/views/explore_view.dart';
import 'package:locus_application/features/solar_system/presentation/views/solar_sys_planets.dart';
import 'package:locus_application/features/stars_classification/presentation/views/stars_view.dart';
import 'package:locus_application/features/vr/presentation/views/vr_game.dart';

class Screens {
  List<Widget> navScreens = [
    ChatbotAIViewBody(),
    CalendarView(),
    SolarSysPlanetsView(),
    //const StarsView(),
    VrGame(),
    const ExploreView(),
  ];
}
