import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';

import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';
import 'package:shopify_app/app/utilities/doshboard_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        title: AppBarTitleWidget(
          title: 'Dashboard',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon: Icon(
              Icons.logout,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0,
          crossAxisCount: 2,
          children: List.generate(
            6,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pages[index],
                    ),
                  );
                },
                child: Card(
                  elevation: 20.0,
                  shadowColor: AppColors.purpleAccent,
                  color: AppColors.blueGrey.withOpacity(0.7),
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: AppColors.yellowAccent,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: AppTextStyles.yellowAccent24w600Acme,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
