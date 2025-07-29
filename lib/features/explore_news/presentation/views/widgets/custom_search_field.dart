import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locus_application/constants/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextField(
        style: TextStyle(color: LocusColors.lightGrey, fontFamily: 'Poppins', fontSize: 12.sp),
        cursorColor: LocusColors.active,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/images/search_icon.svg',
            ),
          ),
          prefixIconColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(color: LocusColors.lightGrey, fontFamily: 'Poppins', fontSize: 12.sp),
          filled: true,
          fillColor: LocusColors.primaryColor2.withOpacity(0.2),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),),
      ),
    );
  }
}
