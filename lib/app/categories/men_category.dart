import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/category_header_label.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shopify_app/app/utilities/categ_list.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            const CategoryHeaderLabel(headerLabel: 'Men'),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 70,
                crossAxisSpacing: 15,
                crossAxisCount: 3,
                children: List.generate(
                  men.length,
                  (index) {
                    return SubCategoryModel(
                      mainCategoryName: 'men',
                      subCategoryName: men[index],
                      assetName: 'images/men/men$index.jpg',
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
