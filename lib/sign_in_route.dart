import 'dart:developer';

import 'package:base_ui_flutter_example/presentation/categories/categories_route.dart';
import 'package:base_ui_flutter_example/presentation/profile/profile.dart';
import 'package:base_ui_flutter_example/sign_up_route.dart';
import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/widget/button/button_associate.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInRoute extends StatelessWidget {
  const SignInRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Stack(
            children: [
              ExpandTapWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  tapPadding: const EdgeInsets.all(8),
                  child: Padding(
                      padding: EdgeInsets.all(32.w),
                      child: SvgPicture.asset("assets/icons/ic_back.svg",
                          semanticsLabel: 'Acme Logo'))),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: AppColors.lightGray, fontSize: 18.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
              child: Image(image: AssetImage('assets/images/img_sign_in.png'))),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.offWhite,
                hintText: 'Enter Username',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.offWhite,
                hintText: 'Password',
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    log("click forgot");
                    //TODO forgot your password
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 16, color: AppColors.textLightBlack),
                    ),
                  ))),
          SizedBox(height: 48),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesRoute()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColors.mainGreen,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
            alignment: Alignment.center,
            child: Text(
              "Or",
              style: TextStyle(color: AppColors.textLightBlack),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AssociateButton().associateBtnFunc(
                  "assets/icons/ic_fb.svg",
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                ),
                AssociateButton().associateBtnFunc("assets/icons/ic_tw.svg",
                    onClick: () {
                  log('data: click tw');
                  //Todo Click btn tw
                }),
                AssociateButton().associateBtnFunc("assets/icons/ic_in.svg",
                    onClick: () {
                  log('data: click in');
                  //Todo Click btn in
                })
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.w),
            child: Text.rich(
              TextSpan(
                text: 'Don’t have an account? ',
                style:
                    TextStyle(fontSize: 16.sp, color: AppColors.textLightBlack),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpRoute()),
                              )
                            }),
                  // can add more TextSpans here...
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
