import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/minor_screens/sub_category_products_screen.dart';

class SubCategoryModel extends StatelessWidget {
  const SubCategoryModel({
    Key? key,
    required this.subCategoryName,
    required this.mainCategoryName,
    required this.assetName,
    required this.subCategoryLabel,
  }) : super(key: key);
  final String subCategoryName;
  final String mainCategoryName;
  final String assetName;
  final String subCategoryLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryProductsScreen(
                      subCategoryName: subCategoryName,
                      mainCategoryName: mainCategoryName,
                    )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subCategoryLabel),
        ],
      ),
    );
  }
}
