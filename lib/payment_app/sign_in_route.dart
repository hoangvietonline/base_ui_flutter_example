import 'dart:developer';

import 'package:base_ui_flutter_example/payment_app/presentation/base/material_base_page.dart';
import 'package:base_ui_flutter_example/payment_app/presentation/categories/categories_route.dart';
import 'package:base_ui_flutter_example/payment_app/presentation/login/login_bloc.dart';
import 'package:base_ui_flutter_example/payment_app/presentation/profile/profile.dart';
import 'package:base_ui_flutter_example/payment_app/sign_up_route.dart';
import 'package:base_ui_flutter_example/payment_app/utils/assets/app_image.dart';
import 'package:base_ui_flutter_example/payment_app/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/payment_app/utils/widget/app_back_widget.dart';
import 'package:base_ui_flutter_example/payment_app/utils/widget/button/button_associate.dart';
import 'package:base_ui_flutter_example/payment_app/utils/widget/textfield/auth_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInRoute extends StatelessWidget {
  const SignInRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SignInPage();
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialBasePage(
      child: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBackWidget(title: 'Sign In'),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: AppImages.imgSignInLogo.widget()),
                      SizedBox(height: 40.h),
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) =>
                            (previous.name != current.name),
                        builder: (context, state) {
                          return AuthTextField(
                            showError: state.inValidName,
                            errorMessage:
                                "Please enter no more that 20 characters",
                            titleText: 'Name',
                            hintText: "Enter your name",
                            onTextFieldChanged: (String name) {
                              // Pass data from view controller to BloC
                              context
                                  .read<LoginBloc>()
                                  .onNameChanged(name: name);
                              // read<>: outside Widget or inside function body, closure
                              // watch<>: inside widget
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) =>
                            (previous.password != current.password),
                        builder: (context, state) {
                          return AuthTextField(
                            showError: state.inValidPassword,
                            keyboardType: TextInputType.visiblePassword,
                            errorMessage:
                                "Password must contain between 6 and 12 characters.",
                            titleText: 'Password',
                            hintText: "Enter your password",
                            onTextFieldChanged: (String pwd) {
                              context
                                  .read<LoginBloc>()
                                  .onPasswordChanged(pwd: pwd);
                            },
                          );
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
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
                                      fontSize: 16,
                                      color: AppColors.textLightBlack),
                                ),
                              ))),
                      SizedBox(height: 48),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoriesRoute()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.mainGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16.h),
                        alignment: Alignment.center,
                        child: const Text(
                          "Or",
                          style: TextStyle(color: AppColors.textLightBlack),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AssociateButton().associateBtnFunc(
                              "assets/icons/ic_fb.svg",
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage()));
                              },
                            ),
                            AssociateButton().associateBtnFunc(
                                "assets/icons/ic_tw.svg", onClick: () {
                              log('data: click tw');
                              //Todo Click btn tw
                            }),
                            AssociateButton().associateBtnFunc(
                                "assets/icons/ic_in.svg", onClick: () {
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
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.textLightBlack),
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
                                              builder: (context) =>
                                                  const SignUpRoute()),
                                        )
                                      },
                              ),
                              // can add more TextSpans here...
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
