import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/decoration/app_decoration.dart';
import 'package:shopify_app/app/presentation/widgets/animation_widgets/animated_logo_widget.dart';
import 'package:shopify_app/app/presentation/widgets/buttons/yellow_button_widget.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal,
];

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.welcomeDecoration,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Welcome',
                    textStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Acme'),
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'Duck Store',
                    textStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Acme'),
                    colors: textColors,
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage('images/inapp/logo.jpg'),
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Acme'),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText('Buy'),
                    RotateAnimatedText('Shop'),
                    RotateAnimatedText('Duck Store'),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Suppliers only',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedLogoWidget(controller: _controller),
                        YellowButtonWidget(
                          label: 'Log In',
                          onTap: () {},
                          width: 0.25,
                        ),
                        YellowButtonWidget(
                          label: 'Sign Up',
                          onTap: () {},
                          width: 0.25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    YellowButtonWidget(
                      label: 'Log In',
                      onTap: () {},
                      width: 0.25,
                    ),
                    YellowButtonWidget(
                      label: 'Sign Up',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/customer_register');
                      },
                      width: 0.25,
                    ),
                    AnimatedLogoWidget(controller: _controller),
                  ],
                ),
              ),
              Container(
                color: Colors.white38,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GoogleFacebookLogInWidget(
                      label: 'Google',
                      child: Image(
                        image: AssetImage('images/inapp/google.jpg'),
                      ),
                      onPressed: () {},
                    ),
                    GoogleFacebookLogInWidget(
                      label: 'Facebook',
                      child: Image(
                        image: AssetImage('images/inapp/facebook.jpg'),
                      ),
                      onPressed: () {},
                    ),
                    GoogleFacebookLogInWidget(
                      label: 'Guest',
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleFacebookLogInWidget extends StatelessWidget {
  const GoogleFacebookLogInWidget({
    Key? key,
    required this.child,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final String label;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(height: 50, width: 50, child: child),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
