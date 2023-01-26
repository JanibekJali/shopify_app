import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_back_button_widget.dart';
import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';

class Statics extends StatelessWidget {
  const Statics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: AppBarTitleWidget(
          title: 'Statics',
        ),
        leading: AppBarBackButtonWidget(),
      ),
    );
  }
}
