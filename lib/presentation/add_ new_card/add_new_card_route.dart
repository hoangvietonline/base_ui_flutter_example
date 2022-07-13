import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String _cardNumber = "1234556789";
  String _dateCreate = "30/01";
  int _balance = 25000;
  String _cvv = "";
  final List<String> months = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  final List<int> years = List<int>.generate(100, (index) => 1960 + index);
  String? _monthValue = "10";
  String? _yearValue = "2020";

  void setCvv(String value) {
    setState(() {
      _cvv = value;
    });
  }

  void setCardNumber(String cardNumber) {
    setState(() {
      _cardNumber = cardNumber;
    });
  }

  void setDateCreate(String dateCreate) {
    setState(() {
      _dateCreate = dateCreate;
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
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _paymentsCard(),
                    AppText.bodyMedium(
                      'Card number',
                      fontSize: 16.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: TextField(
                        onChanged: (text) {
                          setCardNumber(text);
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
                                '01',
                                fontSize: 16.sp,
                              ),
                              items: months
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: AppText.bodyMedium(
                                          item,
                                          fontSize: 16.sp,
                                        ),
                                      ))
                                  .toList(),
                              value: _monthValue,
                              onChanged: (value) {
                                setState(() {
                                  _monthValue = value as String;
                                });
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
                                '2020',
                                fontSize: 16.sp,
                              ),
                              items: years
                                  .map((item) => DropdownMenuItem<String>(
                                        value: '$item',
                                        child: AppText.bodyMedium(
                                          '$item',
                                          fontSize: 16.sp,
                                        ),
                                      ))
                                  .toList(),
                              value: _yearValue,
                              onChanged: (value) {
                                setState(() {
                                  _yearValue = value as String;
                                });
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
                    )
                  ],
                ),
              ),
            ),
            _buttonSaveCard()
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

  Widget _paymentsCard() {
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
              _cardNumber,
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: AppText.bodyMedium(
              "$_monthValue/$_yearValue",
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

  Widget _buttonSaveCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
      child: InkWell(
        onTap: () {
          setCardNumber("cardNumber");
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
}
