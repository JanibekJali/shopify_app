import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/main_screens/customer_screen.dart';

void main() {
  runApp(const ShopifyApp());
}

class ShopifyApp extends StatelessWidget {
  const ShopifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomerScreen(),
    );
  }
}
