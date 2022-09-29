import 'package:base_ui_flutter_example/payment_app/presentation/add_%20new_card/add_card_bloc.dart';
import 'package:base_ui_flutter_example/payment_app/presentation/login/login_bloc.dart';
import 'package:base_ui_flutter_example/payment_app/presentation/onboarding/onboarding_page.dart';
import 'package:base_ui_flutter_example/payment_app/utils/shared_reference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    SharedPreferencesFactory.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          return LoginBloc();
        }),
        BlocProvider(create: (BuildContext context) {
          return AddCardBloc();
        })
      ],
      child: MaterialApp(
        title: 'Example Demo Ui',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingPage(),
        debugShowCheckedModeBanner: false,
        // routes: ,
        // initialRoute: ,
        // navigatorObservers: ,
      ),
    );
  }

  /// Build theme data
  ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: 'Gilroy',
      pageTransitionsTheme: _buildPageTransitionsTheme(),
    );
  }

  /// Custom page transitions theme
  PageTransitionsTheme _buildPageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }
}
