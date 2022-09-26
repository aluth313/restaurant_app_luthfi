import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class TextFieldCustom extends StatelessWidget {
  final Function onChanged;
  final TextEditingController controller;
  final String hintText;
  final Icon? suffixIcon;

  const TextFieldCustom({
    super.key,
    required this.onChanged,
    required this.controller,
    this.suffixIcon,
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
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(
            Icons.search_outlined,
          ),
          suffixIcon: InkWell(
            onTap: () {
              print('ditekan');
            },
            child: Icon(
              Icons.clear_outlined,
              color: redColor,
            ),
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
