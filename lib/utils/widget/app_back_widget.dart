import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/app_icons.dart';
import '../commom/app_text.dart';

class AppBackWidget extends StatelessWidget {
  const AppBackWidget(
      {this.title, this.bgColor, this.isCenter = true, Key? key})
      : super(key: key);

  final String? title;
  final Color? bgColor;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      color: bgColor,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          isCenter
              ? AppText.primary(
                  title ?? '',
                  fontSize: 18.sp,
                )
              : Positioned(
                  right: 30.w,
                  child: AppText.primary(
                    title ?? '',
                    fontSize: 18.sp,
                  ),
                ),
          Positioned(left: 30.w, child: AppIcons.iconBackBlack.widget())
        ],
      ),
    );
  }
}
