import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/app_icons.dart';
import '../commom/app_text.dart';

class AppNavigationWidget extends StatelessWidget {
  const AppNavigationWidget(
      {required this.onPressed, this.title, this.bgColor, Key? key})
      : super(key: key);

  final String? title;
  final Color? bgColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      color: bgColor,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppText.primary(
            title ?? '',
            fontSize: 18.sp,
          ),
          Positioned(
            right: 30.w,
            child: InkWell(
              onTap: () {
                onPressed();
              },
              child: AppIcons.iconMenu.widget(),
            ),
          )
        ],
      ),
    );
  }
}
