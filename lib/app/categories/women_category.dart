import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/category_header_label.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shopify_app/app/utilities/categ_list.dart';

class WomenCategory extends StatelessWidget {
  const WomenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            const CategoryHeaderLabel(headerLabel: 'Women'),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 70,
                crossAxisSpacing: 15,
                crossAxisCount: 3,
                children: List.generate(
                  men.length,
                  (index) {
                    return SubCategoryModel(
                      mainCategoryName: 'women',
                      subCategoryName: men[index],
                      assetName: 'images/women/women$index.jpg',
                      subCategoryLabel: men[index],
                    );
                  },
                ),
              ),
            )
          ],
        ))
      ],
    );
  }
}
