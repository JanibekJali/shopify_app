import 'package:flutter/material.dart';

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
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'What are you looking for?',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(
                        color: Colors.yellow,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
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
        body: const TabBarView(
          children: [
            Center(child: Text('men screen')),
            Center(child: Text('women screen')),
            Center(child: Text('shoes screen')),
            Center(child: Text('bags screen ')),
            Center(child: Text('electronics screen')),
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

class RepeatedTabWidget extends StatelessWidget {
  const RepeatedTabWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      label,
      style: TextStyle(color: Colors.grey.shade600),
    ));
  }
}
