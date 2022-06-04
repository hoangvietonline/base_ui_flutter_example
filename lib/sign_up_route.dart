import 'dart:developer';

import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constant.dart';

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
                      child: SvgPicture.asset("assets/ic_back.svg",
                          semanticsLabel: 'Acme Logo'))),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: HexColor(Constant.grey_500), fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
              child: Image(image: AssetImage('assets/img_sign_up.png'))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: HexColor("#F7F7F7"),
                hintText: 'Enter Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: HexColor("#F7F7F7"),
                hintText: 'Enter Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: HexColor("#F7F7F7"),
                hintText: 'Confirm Password',
              ),
            ),
          ),
          SizedBox(height: 48),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: HexColor(Constant.teal_500),
                  borderRadius: const BorderRadius.all(Radius.circular(2))),
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
                Constant().associateBtnFunc("assets/ic_fb.svg", onClick: () {
                  log('data: click fb');
                  //Todo Click btn fb
                }),
                Constant().associateBtnFunc("assets/ic_tw.svg", onClick: () {
                  log('data: click tw');
                  //Todo Click btn tw
                }),
                Constant().associateBtnFunc("assets/ic_in.svg", onClick: () {
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
                style:
                    TextStyle(fontSize: 16, color: HexColor(Constant.grey_200)),
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
