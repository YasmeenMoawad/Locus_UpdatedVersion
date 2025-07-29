import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/generated/assets.dart';

Widget Function(Function send) sendButton({
  //required Color color,
  //IconData icon = Icons.send,
  //EdgeInsets? padding,
  bool disabled = false,
}) =>
    (Function fct) => InkWell(
          //onTap: disabled ? null : () => fct(),
          child: Container(
            width: 33.w,
            height: 30.h,
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: LocusColors.active,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(Assets.imagesSend),
          ),
        );