import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/auth/customer_register.dart';
import 'package:shopify_app/app/presentation/main_screens/customer_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/supplier_home_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/welcome_screen.dart';

void main() {
  runApp(const ShopifyApp());
}

class ShopifyApp extends StatelessWidget {
  const ShopifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CustomerScreen(),

      // initialRoute: '/welcome_screen',
      // initialRoute: '/customer_screen',
      initialRoute: '/supplier_home_screen',
      routes: {
        '/welcome_screen': (context) => WelcomeScreen(),
        '/customer_screen': (context) => CustomerScreen(),
        '/supplier_home_screen': (context) => SupplierHomeScreen(),
        '/customer_register': (context) => CustomerRegister(),
      },
    );
  }
}
