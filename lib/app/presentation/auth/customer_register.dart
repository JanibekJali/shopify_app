import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  _CustomerRegisterState createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign Up ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/welcome_screen');
                  },
                  icon: Icon(
                    Icons.home_work,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.purpleAccent,
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {
                        log('Pick image from camera');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name ',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.purple,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name ',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.purple,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name ',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.purple,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
