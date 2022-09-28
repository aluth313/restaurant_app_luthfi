import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.padding,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Text(
          text,
          style: customStyleText.copyWith(
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
