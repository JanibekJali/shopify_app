import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/decoration/app_decoration.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';

class AuthMainButtonWidget extends StatelessWidget {
  const AuthMainButtonWidget({
    super.key,
    required this.mainButtonLabel,
    required this.onTap,
  });
  final String mainButtonLabel;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            mainButtonLabel,
            style: AppTextStyles.white20,
          ),
        ),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: AppDecoration.purple20Decration,
      ),
    );
  }
}
