import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';

class AppDecoration {
  static const Decoration welcomeDecoration = BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('images/inapp/bgimage.jpg'),
    ),
  );
  static Decoration purple20Decration = BoxDecoration(
    borderRadius: BorderRadius.circular(20.0),
    color: AppColors.purple,
  );
  static Decoration purple15bottom = BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );
  static Decoration purple15top = BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  );
}
