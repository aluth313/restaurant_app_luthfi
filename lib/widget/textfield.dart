import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class TextFieldCustom extends StatelessWidget {
  final Function(String value)? onChanged;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController controller;
  final String hintText;
  final Icon? suffixIcon;

  const TextFieldCustom({
    super.key,
    this.onChanged,
    required this.controller,
    this.suffixIcon,
    this.onTapSuffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        cursorColor: blackColor,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            Icons.search_outlined,
          ),
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon ?? () {},
            child: suffixIcon ?? SizedBox(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
