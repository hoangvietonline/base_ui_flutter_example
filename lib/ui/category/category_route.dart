import 'package:base_ui_flutter_example/utils/app_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../commom/app_color.dart';
import '../../commom/app_text.dart';
import '../../utils/assets/app_icons.dart';

class CategoryRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoryPage());
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }
}

class CategoryState extends State<CategoryPage> {
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
                  color: HexColor("#F7F7F7"),
                  borderRadius: BorderRadius.circular(4.sp)),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
              child: TextField(
                style: TextStyle(fontSize: 16, color: HexColor("#B0B0C3")),
                scrollPadding: EdgeInsets.all(40.0.sp),
                decoration: InputDecoration(
                  icon: SvgPicture.asset('assets/icons/ic_search.svg'),
                  filled: false,
                  border: InputBorder.none,
                  hintText: 'Search by category',
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _featureCategory('Furniture works', 'assets/icons/ic_furniture.svg/'),
          _featureCategory('Cleaning services', 'assets/icons/ic_cleaning.svg'),
          _featureCategory('Equipment repair', 'assets/icons/ic_equipment.svg'),
          _featureCategory('Courier services', 'assets/icons/ic_courier.svg'),
          _featureCategory('Interior design', 'assets/icons/ic_interiro.svg'),
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
                  border: Border.all(width: 1, color: HexColor("#E2E2E0"))),
              child: AppText.primary(
                'Back',
                fontSize: 16,
                fontFamily: FontFamilyType.ubuntu,
                fontWeight: FontWeightType.regular,
                textAlign: TextAlign.center,
                color: HexColor("#838391"),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              color: HexColor("#20C3AF"),
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

  Widget _featureCategory(String? title, String pathIcon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: HexColor("#E2E2E0"))),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
      child: Row(
        children: [
          Container(
              color: HexColor("#E2E2E0"),
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
    );
  }
}
