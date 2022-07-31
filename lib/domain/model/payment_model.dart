import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../presentation/add_ new_card/add_new_card_route.dart';
import '../../utils/assets/app_image.dart';
import '../../utils/shared_reference_utils.dart';

class Payment {
  final String? cardNumber;
  final String? date;
  final Widget? imageCard;
  final Widget? iconPay;

  Payment({this.cardNumber, this.date, this.imageCard, this.iconPay});
}

extension PaymentExtension on Payment {
  List<PaymentCard> getListCard() {
    String json = SharedPreferencesUtils.getJsonCard();
    if (json == "") {
      return [];
    } else {
      List<PaymentCard> ls = (jsonDecode(json) as List)
          .map((tagJson) => PaymentCard.fromJson(tagJson))
          .toList();
      return ls;
    }
  }

  List<Payment> onCategoryList() {
    return <Payment>[
      for (var card in getListCard())
        Payment(
            cardNumber: card.numberCard,
            date: '${card.month}/${card.year}',
            imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
            iconPay: AppImages.imgVisa.widget())
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgVisa.widget()),
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgMastercard.widget()),
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgVisa.widget()),
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgMastercard.widget()),
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgVisa.widget()),
      // Payment(
      //     cardNumber: '123456789123',
      //     date: '17/2020',
      //     imageCard: AppImages.imgCard.widget(fit: BoxFit.fitWidth),
      //     iconPay: AppImages.imgVisa.widget()),
    ];
  }
}
