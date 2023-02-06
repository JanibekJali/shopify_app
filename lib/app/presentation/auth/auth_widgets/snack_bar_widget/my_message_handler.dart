import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';

class MyMessageHandler {
  static void showSnackBar(var _scaffoldKey, String message) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.yellow,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
