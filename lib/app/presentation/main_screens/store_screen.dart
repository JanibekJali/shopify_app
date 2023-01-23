import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitleWidget(title: 'Store'),
        // leading: AppBarBackButtonWidget(),
      ),
    );
  }
}
