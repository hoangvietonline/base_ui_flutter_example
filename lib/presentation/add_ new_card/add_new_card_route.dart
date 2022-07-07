import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/commom/app_color.dart';
import '../../utils/commom/app_text.dart';
import '../../utils/widget/app_back_widget.dart';

class AddNewCardRoute extends StatelessWidget {
  const AddNewCardRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AddNewCardPage();
}

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBackWidget(
              title: 'Payment cards',
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 40.h),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        gradient: LinearGradient(
                          colors: [AppColors.green_300, AppColors.blue_300],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //TODO save card
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.mainGreen,
                    borderRadius: BorderRadius.circular(2.sp)),
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.all(20.h),
                margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
                child: AppText.bodyMedium(
                  'Save card',
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
