import 'package:flutter/material.dart';

class SubCategoryProductsScreen extends StatelessWidget {
  const SubCategoryProductsScreen({
    Key? key,
    required this.subCategoryName,
    required this.mainCategoryName,
  }) : super(key: key);
  final String subCategoryName;
  final String mainCategoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          subCategoryName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(child: Text(mainCategoryName)),
    );
  }
}
