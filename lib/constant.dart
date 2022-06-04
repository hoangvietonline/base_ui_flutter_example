import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Constant {
  static const grey_500 = "#525464";
  static const grey_200 = "#838391";
  static const grey_50 = "#E2E2E0";
  static const teal_500 = "#20C3AF";

  Widget associateBtnFunc(String path, {required Function onClick}) => Expanded(
          child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: HexColor(Constant.grey_50)),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: SvgPicture.asset(path)),
        ),
      ));
}