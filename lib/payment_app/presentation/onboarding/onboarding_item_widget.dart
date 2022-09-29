import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/onboarding_model.dart';
import '../../utils/commom/app_color.dart';
import '../../utils/commom/app_text.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({Key? key, required this.onBoardingModel})
      : super(key: key);

  final OnBoardingModel? onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTitleWidget(),
          _buildImageWidget(context),
          _buildDescriptionWidget()
        ]);
  }

  Widget _buildTitleWidget() {
    return Container(
      padding: EdgeInsets.only(top: 24.h),
      child: AppText.primary(
        onBoardingModel?.title ?? "",
        fontSize: 40,
        fontFamily: FontFamilyType.ubuntu,
        fontWeight: FontWeightType.medium,
        textAlign: TextAlign.center,
        color: AppColors.textBlack,
      ),
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 69.w),
      height: MediaQuery.of(context).size.height * 0.4,
      child: onBoardingModel?.image ?? const SizedBox(),
    );
  }

  Widget _buildDescriptionWidget() {
    return AppText.bodyMedium(onBoardingModel?.description ?? "",
        textAlign: TextAlign.center);
  }
}
