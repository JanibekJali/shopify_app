import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/presentation/dashboard_components/balance.dart';
import 'package:shopify_app/app/presentation/dashboard_components/edit_profile.dart';
import 'package:shopify_app/app/presentation/dashboard_components/manage_products.dart';
import 'package:shopify_app/app/presentation/dashboard_components/my_store.dart';
import 'package:shopify_app/app/presentation/dashboard_components/orders.dart';
import 'package:shopify_app/app/presentation/dashboard_components/statics.dart';
import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];
List<String> label = [
  'my Store',
  'orders',
  'edit profile',
  'Manage products',
  'Balance',
  'Statics',
];
List<Widget> pages = [
  MyStore(),
  Orders(),
  EditProfile(),
  ManageProducts(),
  Balance(),
  Statics(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
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
                elevation: 20,
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
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.yellowAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
