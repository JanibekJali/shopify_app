import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/galleries/men_gallery.dart';
import 'package:shopify_app/app/presentation/widgets/fake_search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const FakeSearchWidget(),
          bottom: const TabBar(
              indicatorColor: Colors.yellow,
              indicatorWeight: 8,
              isScrollable: true,
              tabs: [
                RepeatedTabWidget(label: 'Men'),
                RepeatedTabWidget(label: 'Women'),
                RepeatedTabWidget(label: 'Shoes'),
                RepeatedTabWidget(label: 'Bags'),
                RepeatedTabWidget(label: 'Electronics'),
                RepeatedTabWidget(label: 'Accessories'),
                RepeatedTabWidget(label: 'Home & gar'),
                RepeatedTabWidget(label: 'Kids'),
                RepeatedTabWidget(label: 'Beauty'),
              ]),
        ),
        body: TabBarView(
          children: [
            MenGallery(),
            Center(child: Text('women screen')),
            Center(child: Text('shoes screen')),
            Center(child: Text('bags screen ')),
            Center(child: Text('Electr screen ')),
            Center(child: Text('accessories screen')),
            Center(child: Text('home & garden screen')),
            Center(child: Text('kids screen')),
            Center(child: Text('beauty screen')),
          ],
        ),
      ),
    );
  }
}
