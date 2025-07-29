import 'package:locus_application/generated/assets.dart';

class OnboardingContent {
  String image;
  String title;
  String discription;

  OnboardingContent({required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Welcome',
      image: Assets.imagesWelcome,
      discription: "Are you ready to explore the space?"
  ),
  OnboardingContent(
      title: 'Explore',
      image: Assets.imagesExplore,
      discription: "Explore celestial bodies above you!"
  ),
  OnboardingContent(
      title: 'Tracking',
      image: Assets.imagesTrack,
      discription: "Know rare actions and track them!"
  ),
  OnboardingContent(
      title: 'Virtual-Reality',
      image: Assets.imagesSimulation,
      discription: "Get a whole space flight journey!"
  ),
];