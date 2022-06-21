import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constant.dart';

class AssociateButton {
  Widget associateBtnFunc(String path, {required Function onClick}) =>
      Expanded(
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