import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/commom/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProfileWidget extends StatelessWidget {
  const ItemProfileWidget({this.title, this.values, this.icon, Key? key})
      : super(key: key);

  final String? title;
  final String? values;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 50.w,
            height: 50.w,
            child: icon,
          ),
          Container(
            color: AppColors.lightGray,
            width: 1.w,
            height: 42.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyMedium(
                  title ?? '',
                  color: AppColors.gray,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                ),
                AppText.bodyMedium(
                  values ?? '',
                  color: AppColors.white,
                  fontSize: 16.sp,
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.lightGray)),
    );
  }
}
