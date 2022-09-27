import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Text(
          'Beri Penilaian',
          style: customStyleText.copyWith(
            color: whiteColor
          ),
        ),
      ),
    );
  }
}
