import 'package:base_ui_flutter_example/constant.dart';
import 'package:base_ui_flutter_example/sign_in_route.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const CreateOderRoute());
}

class CreateOderRoute extends StatelessWidget {
  const CreateOderRoute({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateOderPage(),
    );
  }
}

class CreateOderPage extends StatefulWidget {
  const CreateOderPage({Key? key}) : super(key: key);

  @override
  State<CreateOderPage> createState() => _CreateOderPageState();
}

class _CreateOderPageState extends State<CreateOderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            Text(
              'Create',
              style: TextStyle(
                color: HexColor(Constant.grey_500),
                fontSize: 40,
                fontFamily: 'Ubuntu',
              ),
            ),
            Text(
              'Oder',
              style: TextStyle(
                color: HexColor(Constant.grey_500),
                fontSize: 40,
                fontFamily: 'Ubuntu',
              ),
            ),
            const SizedBox(height: 50),
            const Expanded(
                flex: 3,
                child: Image(image: AssetImage('assets/img_onboarding.png'))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "It's easy, just click on the plus",
                  style: TextStyle(
                      color: HexColor(Constant.grey_200), fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40.0, top: 40.0),
              child: SizedBox(
                height: 82.0,
                width: 82.0,
                child: FloatingActionButton(
                  onPressed: () {
                    _showSignInRoute();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add, color: Colors.white),
                  backgroundColor: HexColor(Constant.teal_500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// func show second route
  void _showSignInRoute() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInRoute()),
    );
  }
}
