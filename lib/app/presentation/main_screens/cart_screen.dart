import 'package:flutter/material.dart';
import 'package:shopify_app/app/presentation/main_screens/customer_screen.dart';
import 'package:shopify_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitleWidget(title: 'Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Your Cart Is Empty!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerScreen(),
                    ),
                  );
                },
                child: Text(
                  'Continue shopping',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Total: \$',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '00.00',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.yellow,
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Text('CHECK OUT'),
            ),
          )
        ],
      ),
    );
  }
}
