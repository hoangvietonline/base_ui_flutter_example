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
                    SizedBox(
                      height: 16.h,
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
                        decoration: InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          fillColor: AppColors.offWhite,
                          hintText: 'card number',
                        ),
                      ),
                    ),
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
              _dateCreate,
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
