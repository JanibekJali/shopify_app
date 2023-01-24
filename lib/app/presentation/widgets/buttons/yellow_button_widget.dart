import 'package:flutter/material.dart';

class YellowButtonWidget extends StatelessWidget {
  const YellowButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    required this.width,
  }) : super(key: key);
  final String label;
  final Function() onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(label)),
        height: 35,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
