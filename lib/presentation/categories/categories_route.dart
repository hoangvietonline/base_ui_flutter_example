import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/widget/app_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets/app_icons.dart';
import '../../utils/commom/app_text.dart';
import '../category/category_route.dart';

class CategoriesRoute extends StatelessWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoriesPage());
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoriesState();
  }
}

class CategoriesState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          AppNavigationWidget(title: 'Categories'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              alignment: Alignment.center,
              height: 70.h,
              decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(4.sp)),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
              child: TextField(
                style: const TextStyle(fontSize: 16, color: AppColors.gray),
                scrollPadding: EdgeInsets.all(40.0.sp),
                decoration: InputDecoration(
                  icon: SvgPicture.asset('assets/icons/ic_search.svg'),
                  filled: false,
                  border: InputBorder.none,
                  hintText: 'Search by categories',
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _featureCategory('Furniture works', 'assets/icons/ic_furniture.svg',
              callback: () {}),
          _featureCategory('Cleaning services', 'assets/icons/ic_cleaning.svg',
              callback: () {}),
          _featureCategory('Equipment repair', 'assets/icons/ic_equipment.svg',
              callback: () {}),
          _featureCategory('Courier services', 'assets/icons/ic_courier.svg',
              callback: () {}),
          _featureCategory('Interior design', 'assets/icons/ic_interiro.svg',
              callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryRoute()),
            );
          }),
          SizedBox(
            height: 36.h,
          ),
          _backAndNext()
        ],
      ),
    ));
  }

  Widget _backAndNext() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColors.lightGray)),
              child: AppText.primary(
                'Back',
                fontSize: 16,
                fontFamily: FontFamilyType.ubuntu,
                fontWeight: FontWeightType.regular,
                textAlign: TextAlign.center,
                color: AppColors.textLightBlack,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              color: AppColors.mainGreen,
              child: AppText.primary(
                'Next',
                fontSize: 16,
                fontFamily: FontFamilyType.ubuntu,
                fontWeight: FontWeightType.regular,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCategory(String? title, String pathIcon,
      {required Function callback}) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: AppColors.lightGray)),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
        child: Row(
          children: [
            Container(
                color: AppColors.lightGray,
                padding: EdgeInsets.all(16.w),
                width: 70.w,
                height: 70.w,
                child: SvgPicture.asset(pathIcon)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppText.primary(
                  title ?? "",
                  fontSize: 16,
                  fontFamily: FontFamilyType.ubuntu,
                  fontWeight: FontWeightType.regular,
                  textAlign: TextAlign.center,
                  color: AppColors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppIcons.icon_arrow_right.widget(),
            ),
          ],
        ),
      ),
    );
  }
}
