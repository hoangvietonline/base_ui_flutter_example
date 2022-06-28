import 'package:base_ui_flutter_example/presentation/payment_card/payment_cards.dart';
import 'package:base_ui_flutter_example/utils/assets/app_icons.dart';
import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/commom/app_text.dart';
import 'package:base_ui_flutter_example/utils/widget/app_back_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsPage();
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBackWidget(
              title: 'Settings',
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemSettingsWidget('Payment cards', callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentCardsRoute()));
                  }),
                  _itemSettingsWidget('Write to us', callback: () {}),
                  _itemSettingsWidget('Rate us on app store', callback: () {}),
                  _itemSettingsWidget('About Us', callback: () {}),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.textLightBlack),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Log Out',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemSettingsWidget(String title, {required Function callback}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      color: AppColors.offWhite,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Row(
          children: [
            Expanded(
              child: AppText.bodyMedium(title),
              flex: 1,
            ),
            AppIcons.icon_arrow_right.widget()
          ],
        ),
      ),
    );
  }
}
