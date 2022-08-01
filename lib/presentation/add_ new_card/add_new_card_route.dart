import 'dart:convert';

import 'package:base_ui_flutter_example/presentation/add_%20new_card/add_card_bloc.dart';
import 'package:base_ui_flutter_example/utils/shared_reference_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int _balance = 25000;
  String _cvv = "";

  final List<int> years = List<int>.generate(100, (index) => 1960 + index);

  final List<int> months = List<int>.generate(12, (index) => 1 + index);

  void setCvv(String value) {
    setState(() {
      _cvv = value;
    });
  }

  void setBalance(int value) {
    setState(() {
      _balance = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const AppBackWidget(
              title: 'Payment cards',
            ),
            BlocBuilder<AddCardBloc, AddCardState>(
              builder: (context, state) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _paymentsCard(state),
                        AppText.bodyMedium(
                          'Card number',
                          fontSize: 16.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: TextField(
                            onChanged: (text) {
                              context
                                  .read<AddCardBloc>()
                                  .onChangeCardNumber(cardNumber: text);
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              fillColor: AppColors.offWhite,
                              hintText: 'card number',
                            ),
                          ),
                        ),
                        _titleFeatureCard(),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: AppColors.offWhite,
                              height: 60.h,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  buttonPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  dropdownMaxHeight: 100.h,
                                  hint: AppText.bodyMedium(
                                    '${state.month}',
                                    fontSize: 16.sp,
                                  ),
                                  items: months
                                      .map((item) => DropdownMenuItem<int>(
                                            value: item,
                                            child: AppText.bodyMedium(
                                              '$item',
                                              fontSize: 16.sp,
                                            ),
                                          ))
                                      .toList(),
                                  value: state.month,
                                  onChanged: (value) {
                                    context
                                        .read<AddCardBloc>()
                                        .onChangeMonth(month: value as int);
                                  },
                                  buttonHeight: 40,
                                  itemHeight: 40,
                                ),
                              ),
                            )),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                                child: Container(
                              height: 60.h,
                              color: AppColors.offWhite,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  buttonPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  dropdownMaxHeight: 100.h,
                                  hint: AppText.bodyMedium(
                                    '${state.year}',
                                    fontSize: 16.sp,
                                  ),
                                  items: years
                                      .map((item) => DropdownMenuItem<int>(
                                            value: item,
                                            child: AppText.bodyMedium(
                                              '$item',
                                              fontSize: 16.sp,
                                            ),
                                          ))
                                      .toList(),
                                  value: state.year,
                                  onChanged: (value) {
                                    context
                                        .read<AddCardBloc>()
                                        .onChangeYear(year: value as int);
                                  },
                                  buttonHeight: 40,
                                  itemHeight: 40,
                                ),
                              ),
                            )),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 16.w),
                              height: 60.h,
                              color: AppColors.offWhite,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '****',
                                    suffixIcon: Icon(Icons.remove_red_eye)),
                                onChanged: (text) {
                                  setCvv(text);
                                },
                              ),
                            )),
                          ],
                        ),
                        _buttonSaveCard(state)
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleFeatureCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: AppText.bodyMedium(
          'Exp. Month',
          fontSize: 16.sp,
        )),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
            child: AppText.bodyMedium(
          'Exp.Year',
          fontSize: 16.sp,
        )),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
            child: AppText.bodyMedium(
          'CVV',
          fontSize: 16.sp,
        )),
      ],
    );
  }

  Widget _paymentsCard(AddCardState state) {
    return Container(
      padding: EdgeInsets.all(23.w),
      margin: EdgeInsets.symmetric(vertical: 40.h),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        gradient: const LinearGradient(
          colors: [AppColors.green_300, AppColors.blue_300],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: AppText.bodyMedium(
              state.cardNumber ?? '',
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: AppText.bodyMedium(
              "${state.month}/${state.year}",
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: AppText.bodyMedium(
              "\$ $_balance",
              fontSize: 18.sp,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonSaveCard(AddCardState state) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const NotificationRoute()));

          setListCard(state);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.mainGreen,
              borderRadius: BorderRadius.circular(2.sp)),
          padding: EdgeInsets.all(20.h),
          child: AppText.bodyMedium(
            'Save card',
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Future<List<PaymentCard>> getListCard() async {
    String json = await SharedPreferencesUtils.getJsonCard();
    if (json != "") {
      var cardJson = jsonDecode(json) as List;
      List<PaymentCard> ls =
          cardJson.map((tagJson) => PaymentCard.fromJson(tagJson)).toList();
      return ls;
    } else {
      return [];
    }
  }

  void setListCard(AddCardState state) async {
    PaymentCard paymentCard =
        PaymentCard(state.cardNumber, state.month, state.year);
    List<PaymentCard> ls = await getListCard();
    ls.add(paymentCard);
    String jsonPaymentCard = jsonEncode(ls);
    await SharedPreferencesUtils.setJsonCard(jsonPaymentCard);
    Navigator.pop(context, {'isUpdate': true});
  }
}

class PaymentCard {
  PaymentCard(this.numberCard, this.month, this.year);

  String? numberCard;
  int month = 1;
  int year = 2020;

  factory PaymentCard.fromJson(dynamic json) {
    return PaymentCard(json["numberCard"] as String, json["month"] as int,
        json["year"] as int);
  }

  Map toJson() => {"numberCard": numberCard, "month": month, "year": year};
}
