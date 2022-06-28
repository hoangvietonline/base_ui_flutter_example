import 'package:flutter/cupertino.dart';

import '../../utils/assets/app_image.dart';

class Payment {
  final String? cardNumber;
  final String? date;
  final Widget? imageCard;
  final Widget? iconPay;

  Payment({this.cardNumber, this.date, this.imageCard, this.iconPay});
}

extension PaymentExtension on Payment {
  List<Payment> onCategoryList() {
    return <Payment>[
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgVisa.widget()),
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgMastercard.widget()),
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgVisa.widget()),
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgMastercard.widget()),
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgVisa.widget()),
      Payment(
          cardNumber: '123456789123',
          date: '17/2020',
          imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
          iconPay: AppImages.imgVisa.widget()),
    ];
  }
}
