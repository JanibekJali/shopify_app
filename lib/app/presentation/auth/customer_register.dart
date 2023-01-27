import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/constants/decoration/app_decoration.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shopify_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  _CustomerRegisterState createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Sing Up text

                    Text(
                      'Sign Up ',
                      style: AppTextStyles.Bold40,
                    ),
                    // home_work black icon
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/welcome_screen');
                      },
                      icon: Icon(
                        Icons.home_work,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  // CircleAvatar purpleAccont
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.purpleAccent,
                    ),
                  ),
                  Column(
                    children: [
                      // top camera icon
                      Container(
                        decoration: AppDecoration.purple15top,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            log('Pick image from camera');
                          },
                        ),
                      ),
                      SizedBox(height: 6.0),
                      // bottom camera icon
                      Container(
                        decoration: AppDecoration.purple15bottom,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            log('Pick image from gallery');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // TextFormFieldWidget
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormFieldWidget(hintText: 'Full Name'),
                    const SizedBox(height: 15.0),
                    TextFormFieldWidget(hintText: 'Email Address'),
                    const SizedBox(height: 15.0),
                    TextFormFieldWidget(hintText: 'Password'),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              // already have account text
              Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: Row(
                  children: [
                    Text('already have account?'),
                    SizedBox(width: 5.0),
                    Text(
                      'Log In',
                      style: AppTextStyles.purple15Bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 55.0),
              // Sign Up button
              Container(
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: AppTextStyles.white20,
                  ),
                ),
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: AppDecoration.purple20Decration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
