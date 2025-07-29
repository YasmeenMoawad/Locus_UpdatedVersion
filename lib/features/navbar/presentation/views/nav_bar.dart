import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/core/utils/background/logic/background_cubit.dart';
import 'package:locus_application/features/navbar/presentation/logic/nav_bar_cubit.dart';
import 'package:locus_application/features/navbar/presentation/views/nav_bar_screens.dart';
import 'package:locus_application/features/navbar/presentation/views/widgets/nav_bar_icon.dart';
import 'package:locus_application/generated/assets.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => BackgroundCubit(),
        ),
      ],
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          int index = BlocProvider.of<NavBarCubit>(context).index;
          void onChangedTab (int index) {
            BlocProvider.of<NavBarCubit>(context).onChangedTab(index);
          }
          return Scaffold(
            backgroundColor: LocusColors.bgOfPlanetIcon,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: ()=> onChangedTab(2),
              elevation: 0,
              child: Image.asset(Assets.imagesSolarsysIcon),
            ),
            bottomNavigationBar: BottomAppBar(
              height: 50.h,
              notchMargin: 10.h,
              color: LocusColors.primaryColor.withOpacity(0.3),
              shape: const CircularNotchedRectangle(),
              child: NavBarIcon(index: index, onChangedTab: onChangedTab),
            ),
            body: Screens().navScreens[BlocProvider.of<NavBarCubit>(context).index],
          );
        },
      ),
    );
  }
}


