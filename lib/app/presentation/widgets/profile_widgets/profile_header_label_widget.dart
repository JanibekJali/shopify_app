import 'package:flutter/material.dart';

class ProfileHeaderLabelWidget extends StatelessWidget {
  const ProfileHeaderLabelWidget({
    Key? key,
    required this.headerlabel,
  }) : super(key: key);
  final String headerlabel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            headerlabel,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
