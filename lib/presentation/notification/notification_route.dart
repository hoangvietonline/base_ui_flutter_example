import 'package:base_ui_flutter_example/utils/widget/app_back_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/notification_model.dart';
import '../../utils/assets/app_image.dart';
import '../../utils/commom/app_color.dart';
import '../../utils/commom/app_text.dart';

class NotificationRoute extends StatelessWidget {
  const NotificationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const NotificationPage();
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> dataNotification =
      NotificationModel().onNotificationList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBackWidget(
              title: 'Notification',
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dataNotification.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemNotification(dataNotification[index]);
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              child: InkWell(
                onTap: () {
                  //no-op
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainGreen,
                      borderRadius: BorderRadius.circular(2.sp)),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 21.h),
                  child: AppText.bodyMedium(
                    'View all',
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemNotification(NotificationModel model) {
    return Container(
      padding: EdgeInsets.all(30.w),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 56 / 2,
                backgroundColor: AppColors.lightGray,
                child: Padding(
                  padding: const EdgeInsets.all(1), // Border radius
                  child: ClipOval(
                      child: AppImages.imgAvatarNotification(
                              model.avatar ?? 'avatar_1.png')
                          .widget()),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyMedium(
                    model.name ?? "",
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                  AppText.bodyMedium(
                    model.company ?? "",
                    fontSize: 14.sp,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          AppText.bodyMedium(
            model.message ?? '',
            fontSize: 14.sp,
            fontFamily: FontFamilyType.ubuntu,
            fontWeight: FontWeightType.medium,
          ),
        ],
      ),
    );
  }
}
