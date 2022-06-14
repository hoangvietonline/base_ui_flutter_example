import 'dart:developer';

import 'package:base_ui_flutter_example/sign_up_route.dart';
import 'package:base_ui_flutter_example/ui/categories/categories_route.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constant.dart';

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
                      padding: const EdgeInsets.all(32),
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
                          color: HexColor(Constant.grey_500), fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
              child: Image(image: AssetImage('assets/images/img_sign_in.png'))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: HexColor("#F7F7F7"),
                hintText: 'Enter Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: HexColor("#F7F7F7"),
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
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 16, color: HexColor(Constant.grey_200)),
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
                decoration: BoxDecoration(
                    color: HexColor(Constant.teal_500),
                    borderRadius: const BorderRadius.all(Radius.circular(2))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            alignment: Alignment.center,
            child: Text(
              "Or",
              style: TextStyle(color: HexColor(Constant.grey_200)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Constant().associateBtnFunc("assets/icons/ic_fb.svg",
                    onClick: () {
                  log('data: click fb');
                  //Todo Click btn fb
                }),
                Constant().associateBtnFunc("assets/icons/ic_tw.svg",
                    onClick: () {
                  log('data: click tw');
                  //Todo Click btn tw
                }),
                Constant().associateBtnFunc("assets/icons/ic_in.svg",
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
                text: 'Don’t have an account? ',
                style:
                    TextStyle(fontSize: 16, color: HexColor(Constant.grey_200)),
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
