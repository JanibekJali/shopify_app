import 'package:flutter/material.dart';
import 'package:shopify_app/app/categories/accessories_category.dart';
import 'package:shopify_app/app/categories/bags_category.dart';
import 'package:shopify_app/app/categories/beauty_category.dart';
import 'package:shopify_app/app/categories/electronics_category.dart';
import 'package:shopify_app/app/categories/home_garden_category.dart';
import 'package:shopify_app/app/categories/kids_category.dart';
import 'package:shopify_app/app/categories/men_category.dart';
import 'package:shopify_app/app/categories/shoes_category.dart';
import 'package:shopify_app/app/categories/women_category.dart';
import 'package:shopify_app/app/presentation/widgets/fake_search_widget.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids & garden'),
  ItemsData(label: 'beauty & garden'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    for (var element in items) {
      element.isSelected = true;
    }
    setState(() {
      items[0].isSelected = false;
    });
    super.initState();
  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const FakeSearchWidget()),
      body: Stack(children: [
        Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
        Positioned(bottom: 0, right: 0, child: categoryView(size)),
      ]),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                for (var element in items) {
                  element.isSelected = false;
                }
                setState(() {
                  items[index].isSelected = true;
                });
                // _pageController.jumpToPage(index);
                _pageController.animateToPage(index,
                    duration: const Duration(microseconds: 100),
                    curve: Curves.bounceInOut);
              },
              child: Container(
                height: 100,
                color: items[index].isSelected == true
                    ? Colors.white
                    : Colors.grey.shade300,
                child: Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
    );
  }

  Widget categoryView(Size size) {
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        onPageChanged: (tandalganSidebar) {
          for (var sideBarIndex in items) {
            sideBarIndex.isSelected = false;
          }
          setState(() {
            items[tandalganSidebar].isSelected = true;
          });
        },
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeGardenCategory(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({
    required this.label,
    this.isSelected = false,
  });
}
