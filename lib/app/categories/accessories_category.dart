import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/category_header_label.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shopify_app/app/utilities/categ_list.dart';

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            const CategoryHeaderLabel(headerLabel: 'Accessories'),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 70,
                crossAxisSpacing: 15,
                crossAxisCount: 3,
                children: List.generate(
                  accessories.length,
                  (index) {
                    return SubCategoryModel(
                      mainCategoryName: 'accessories',
                      subCategoryName: accessories[index],
                      assetName: 'images/accessories/accessories$index.jpg',
                      subCategoryLabel: accessories[index],
                    );
                  },
                ),
              ),
            )
          ],
        )),
        const Positioned(
          bottom: 0,
          right: 0,
          child: SliderWidget(mainSliderText: 'Accessories'),
        ),
      ],
    );
  }
}
