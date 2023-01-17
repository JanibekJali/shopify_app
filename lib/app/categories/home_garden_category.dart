import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/category_header_label.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shopify_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shopify_app/app/utilities/categ_list.dart';

class HomeGardenCategory extends StatelessWidget {
  const HomeGardenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            const CategoryHeaderLabel(headerLabel: 'Home & Garden'),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 70,
                crossAxisSpacing: 15,
                crossAxisCount: 2,
                children: List.generate(
                  homeandgarden.length,
                  (index) {
                    return SubCategoryModel(
                      mainCategoryName: 'homeandgarden',
                      subCategoryName: homeandgarden[index],
                      assetName: 'images/homegarden/home$index.jpg',
                      subCategoryLabel: homeandgarden[index],
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
          child: SliderWidget(mainSliderText: 'Home & Garden'),
        ),
      ],
    );
  }
}
