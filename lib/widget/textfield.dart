import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class TextFieldCustom extends StatelessWidget {
  final Function(String value)? onChanged;
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;

  const TextFieldCustom({
    super.key,
    this.onChanged,
    required this.controller,
    this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: prefixIcon == null
          ? TextFormField(
              cursorColor: blackColor,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: secondaryColor,
                  ),
                ),
              ),
            )
          : TextFormField(
              cursorColor: blackColor,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
    );
  }
}
