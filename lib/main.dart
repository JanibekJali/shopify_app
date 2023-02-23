import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/auth/customer_login.dart';
import 'package:shopify_app/app/presentation/auth/customer_signup.dart';
import 'package:shopify_app/app/presentation/auth/supplier_login.dart';
import 'package:shopify_app/app/presentation/auth/supplier_signup.dart';
import 'package:shopify_app/app/presentation/main_screens/customer_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/supplier_home_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/upload_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShopifyApp());
}

class ShopifyApp extends StatelessWidget {
  const ShopifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadScreen(),

      // initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => WelcomeScreen(),
        '/customer_screen': (context) => CustomerScreen(),
        '/supplier_home_screen': (context) => SupplierHomeScreen(),
        '/customer_signup': (context) => CustomerSignUp(),
        '/customer_login': (context) => CustomerLogin(),
        '/supplier_signup': (context) => SuppliersSignUp(),
        '/supplier_login': (context) => SuppliersLogin(),
      },
    );
  }
}
