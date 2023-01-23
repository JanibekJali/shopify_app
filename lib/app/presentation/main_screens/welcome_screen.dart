import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/decoration/app_decoration.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.welcomeDecoration,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
