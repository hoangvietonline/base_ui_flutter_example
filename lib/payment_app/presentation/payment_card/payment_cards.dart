import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/payment_model.dart';
import '../../utils/commom/app_color.dart';
import '../../utils/commom/app_text.dart';
import '../../utils/widget/app_back_widget.dart';
import '../add_ new_card/add_new_card_route.dart';

class PaymentCardsRoute extends StatelessWidget {
  const PaymentCardsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const PaymentCardsPage();
}

class PaymentCardsPage extends StatefulWidget {
  const PaymentCardsPage({Key? key}) : super(key: key);

  @override
  State<PaymentCardsPage> createState() => _PaymentCardsPageState();
}

class _PaymentCardsPageState extends State<PaymentCardsPage> {
  late Future<List<Payment>> loadData;

  @override
  void initState() {
    super.initState();
    loadData = Payment().onCategoryList();
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
              child: FutureBuilder(
                future: loadData,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Payment>> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    List<Payment>? data = snapshot.data;
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _itemPayments(data?[index] ?? Payment());
                        });
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              child: InkWell(
                onTap: () {
                  _navigateAddNewCard(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainGreen,
                      borderRadius: BorderRadius.circular(2.sp)),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 21.h),
                  child: AppText.bodyMedium(
                    'Add new card',
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

  Future<void> _navigateAddNewCard(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewCardRoute()),
    );
    if (!mounted) return;

    if (result['isUpdate']) {
      setState(() {
        loadData = Payment().onCategoryList();
      });
    }
  }

  Widget _itemPayments(Payment payment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.lightGray)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 70.w,
            child: payment.imageCard,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.primary(
                    payment.cardNumber ?? '',
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                  AppText.bodyMedium(
                    payment.date ?? '',
                    color: AppColors.gray,
                    fontSize: 12.sp,
                    fontWeight: FontWeightType.regular,
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 32.w,
            height: 32.w,
            child: payment.iconPay,
          )
        ],
      ),
    );
  }
}
