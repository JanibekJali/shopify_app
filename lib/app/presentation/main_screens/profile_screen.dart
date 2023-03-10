import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/presentation/customer_screens/customer_order_screen.dart';
import 'package:shopify_app/app/presentation/customer_screens/customer_wishlist_screen.dart';
import 'package:shopify_app/app/presentation/main_screens/cart_screen.dart';
import 'package:shopify_app/app/presentation/widgets/profile_widgets/profile_header_label_widget.dart';
import 'package:shopify_app/app/presentation/widgets/profile_widgets/repeated_list_tile_widget.dart';
import 'package:shopify_app/app/presentation/widgets/profile_widgets/yellow_divider_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    // required this.documentId,
  }) : super(key: key);
  // final String documentId;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: customers.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Stack(children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.yellow,
                      Colors.brown,
                    ],
                  ),
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    expandedHeight: 120,
                    flexibleSpace:
                        LayoutBuilder(builder: (context, constraint) {
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Row(
                              children: [
                                data['profileImage'] == ''
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'images/inapp/guest.jpg'),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            NetworkImage(data['profileImage'])),
                                Text(
                                  data['name'] == ''
                                      ? 'Guest'.toUpperCase()
                                      : data['name'].toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        30,
                                      ),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CartScreen()));
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Cart',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.yellow,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerOrderScreen()));
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Orders',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        30,
                                      ),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerWishlistScreen()));
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Wishlist',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          color: Colors.grey.shade300,
                          child: Column(children: [
                            SizedBox(
                              height: 150,
                              child: Image(
                                image: AssetImage('images/inapp/logo.jpg'),
                              ),
                            ),
                            ProfileHeaderLabelWidget(
                                headerlabel: '  Account Info.  '),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    RepeatedListTileWidget(
                                      icon: Icons.email,
                                      title: 'Email Address',
                                      subtitle: data['email'] == ''
                                          ? 'Anonymous email'
                                          : data['email'],
                                    ),
                                    YellowDividerWidget(),
                                    RepeatedListTileWidget(
                                      icon: Icons.phone,
                                      title: 'Phone No.',
                                      subtitle: data['phone'] == ''
                                          ? 'Ano phone'
                                          : data['phone'],
                                    ),
                                    YellowDividerWidget(),
                                    RepeatedListTileWidget(
                                      icon: Icons.location_pin,
                                      title: 'Address',
                                      subtitle: data['address'] == ''
                                          ? 'Ano Address'
                                          : data['address'],
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ProfileHeaderLabelWidget(
                                headerlabel: '  Account Settings  '),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    RepeatedListTileWidget(
                                      icon: Icons.edit,
                                      title: 'Edit Profile',
                                      onPressed: () {},
                                    ),
                                    YellowDividerWidget(),
                                    RepeatedListTileWidget(
                                      icon: Icons.lock,
                                      title: 'Change Password',
                                      onPressed: () {},
                                    ),
                                    YellowDividerWidget(),
                                    RepeatedListTileWidget(
                                      icon: Icons.logout,
                                      title: 'Log Out',
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.pushReplacementNamed(
                                            context, '/welcome_screen');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: AppColors.purple,
          ),
        );
      },
    );
  }
}
// CRUD 
// CREATE  - post
// READ  - get 
// UPDATE - put 
// DELETE - delete
