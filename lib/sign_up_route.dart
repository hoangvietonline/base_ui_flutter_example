import 'dart:developer';

import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/widget/button/button_associate.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpRoute extends StatelessWidget {
  const SignUpRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      padding: const EdgeInsets.all(32),
                      child: SvgPicture.asset("assets/icons/ic_back.svg",
                          semanticsLabel: 'Acme Logo'))),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppColors.textBlack, fontSize: 18.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
              child: Image(image: AssetImage('assets/images/img_sign_up.png'))),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.offWhite,
                hintText: 'Enter Email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.offWhite,
                hintText: 'Enter Password',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.offWhite,
                hintText: 'Confirm Password',
              ),
            ),
          ),
          SizedBox(height: 48),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppColors.mainGreen,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            alignment: Alignment.center,
            child: const Text(
              "Or",
              style: TextStyle(color: AppColors.textLightBlack),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AssociateButton().associateBtnFunc("assets/icons/ic_fb.svg",
                    onClick: () {
                  log('data: click fb');
                  //Todo Click btn fb
                }),
                AssociateButton().associateBtnFunc("assets/icons/ic_tw.svg",
                    onClick: () {
                  log('data: click tw');
                  //Todo Click btn tw
                }),
                AssociateButton().associateBtnFunc("assets//icons/ic_in.svg",
                    onClick: () {
                  log('data: click in');
                  //Todo Click btn in
                })
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                    fontSize: 16, color: AppColors.textLightBlack),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              //todo Press sign Up
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
