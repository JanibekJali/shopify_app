import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            expandedHeight: 120,
            flexibleSpace: LayoutBuilder(builder: (context, constraint) {
              return FlexibleSpaceBar(
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: constraint.biggest.height <= 120 ? 1 : 0,
                  child: Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.brown],
                    ),
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(children: [
                  Container(
                    child: Text(
                      'Cart',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
              )
            ]),
          )
        ],
      ),
    );
  }
}
