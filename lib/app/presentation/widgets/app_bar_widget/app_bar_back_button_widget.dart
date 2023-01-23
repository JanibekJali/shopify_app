import 'package:flutter/material.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  const AppBarBackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }
}
