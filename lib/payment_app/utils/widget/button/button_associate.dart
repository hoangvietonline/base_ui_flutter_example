import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../commom/app_color.dart';

class AssociateButton {
  Widget associateBtnFunc(String path, {required Function onClick}) => Expanded(
          child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.lightGray),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: SvgPicture.asset(path)),
        ),
      ));
}
