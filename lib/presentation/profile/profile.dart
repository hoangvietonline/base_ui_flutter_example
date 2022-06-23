import 'package:base_ui_flutter_example/utils/assets/app_icons.dart';
import 'package:base_ui_flutter_example/utils/commom/app_text.dart';
import 'package:base_ui_flutter_example/utils/widget/app_back_widget.dart';
import 'package:base_ui_flutter_example/utils/widget/item_info_profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/assets/app_image.dart';
import '../../utils/commom/app_color.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ProfilePage();
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            color: AppColors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                const AppBackWidget(
                  title: "Basket (3)",
                ),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: AppColors.lightGray,
                  child: Padding(
                    padding: const EdgeInsets.all(1), // Border radius
                    child: ClipOval(
                        child: AppImages.imgAvatar.widget(fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppText.primary(
                  "Tomy",
                  fontSize: 18.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.bodyMedium("Da Nang"),
                    SizedBox(
                      width: 8.w,
                    ),
                    AppText.bodyMedium("\u25CF"),
                    SizedBox(
                      width: 8.w,
                    ),
                    AppText.bodyMedium('ID : 1120611')
                  ],
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        fontSize: 16.sp, color: AppColors.textLightBlack),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Edit',
                          style: const TextStyle(
                            color: Colors.deepOrangeAccent,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  //Todo
                                }),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
                _aboutMeAndSettings()
              ],
            ),
          ),
          Container(
            color: AppColors.textBlack,
            width: double.infinity,
            height: (MediaQuery.of(context).size.height * 0.45) - (MediaQuery.of(context).viewPadding.top),
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemProfileWidget(
                  title: 'Phone number',
                  values: '+8446589923',
                  icon: AppIcons.iconNumberPhone.widget(),
                ),
                ItemProfileWidget(
                  title: 'Email',
                  values: 'contact@gmail.com',
                  icon: AppIcons.icEmail.widget(),
                ),
                ItemProfileWidget(
                  title: 'Completed projects',
                  values: '248',
                  icon: AppIcons.icCompleted.widget(),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _aboutMeAndSettings() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: AppColors.mainGreen,
              child: AppText.primary(
                'About Me',
                fontSize: 16,
                fontFamily: FontFamilyType.ubuntu,
                fontWeight: FontWeightType.regular,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColors.lightGray)),
              child: AppText.primary(
                'Settings',
                fontSize: 16,
                fontFamily: FontFamilyType.ubuntu,
                fontWeight: FontWeightType.regular,
                textAlign: TextAlign.center,
                color: AppColors.textLightBlack,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
