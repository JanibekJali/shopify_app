import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/category_header_label.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shopify_app/app/utilities/categ_list.dart';

class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            const CategoryHeaderLabel(headerLabel: 'Electronics'),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 70,
                crossAxisSpacing: 15,
                crossAxisCount: 3,
                children: List.generate(
                  electronics.length,
                  (index) {
                    return SubCategoryModel(
                      mainCategoryName: 'electronics',
                      subCategoryName: electronics[index],
                      assetName: 'images/electronics/electronics$index.jpg',
                      subCategoryLabel: electronics[index],
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
          child: SliderWidget(mainSliderText: 'electronics'),
        ),
      ],
    );
  }
}
