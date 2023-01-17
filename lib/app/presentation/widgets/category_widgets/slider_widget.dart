import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.mainSliderText,
  }) : super(key: key);
  final String mainSliderText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.brown.withOpacity(0.2),
          ),
          child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  mainSliderText == 'beauty'
                      ? const Text('')
                      : const Text(
                          '<<',
                          style: AppTextStyles.brown16Bold,
                        ),
                  Text(mainSliderText.toUpperCase()),
                  mainSliderText == 'men'
                      ? const Text('')
                      : const Text(
                          '>>',
                          style: AppTextStyles.brown16Bold,
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
