import 'package:flutter/material.dart';

class YellowDividerWidget extends StatelessWidget {
  const YellowDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        thickness: 1,
        color: Colors.yellow,
      ),
    );
  }
}
